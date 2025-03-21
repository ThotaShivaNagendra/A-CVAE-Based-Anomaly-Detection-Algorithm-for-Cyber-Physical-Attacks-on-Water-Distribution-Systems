from django.db.models import Count
from django.db.models import Q
from django.shortcuts import render, redirect, get_object_or_404

import pandas as pd
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.metrics import accuracy_score, confusion_matrix, classification_report
from sklearn.metrics import accuracy_score
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder 
from sklearn.ensemble import GradientBoostingClassifier, RandomForestClassifier, VotingClassifier
from sklearn.svm import SVC
from sklearn.metrics import accuracy_score
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler, LabelEncoder 
# Create your views here.
from Remote_User.models import ClientRegister_Model,Water_Distribution_Attacks,detection_ratio,detection_accuracy

def login(request):


    if request.method == "POST" and 'submit1' in request.POST:

        username = request.POST.get('username')
        password = request.POST.get('password')
        try:
            enter = ClientRegister_Model.objects.get(username=username,password=password)
            request.session["userid"] = enter.id

            return redirect('ViewYourProfile')
        except:
            pass

    return render(request,'RUser/login.html')

def index(request):
    return render(request, 'RUser/index.html')

def Add_DataSet_Details(request):

    return render(request, 'RUser/Add_DataSet_Details.html', {"excel_data": ''})


def Register1(request):

    if request.method == "POST":
        username = request.POST.get('username')
        email = request.POST.get('email')
        password = request.POST.get('password')
        phoneno = request.POST.get('phoneno')
        country = request.POST.get('country')
        state = request.POST.get('state')
        city = request.POST.get('city')
        address = request.POST.get('address')
        gender = request.POST.get('gender')
        ClientRegister_Model.objects.create(username=username, email=email, password=password, phoneno=phoneno,
                                            country=country, state=state, city=city,address=address,gender=gender)

        obj = "Registered Successfully"
        return render(request, 'RUser/Register1.html',{'object':obj})
    else:
        return render(request,'RUser/Register1.html')

def ViewYourProfile(request):
    userid = request.session['userid']
    obj = ClientRegister_Model.objects.get(id= userid)
    return render(request,'RUser/ViewYourProfile.html',{'object':obj})


def Predict_Water_Distribution_Attacks(request):
    if request.method == "POST":

        if request.method == "POST":

            Pump_Speed= request.POST.get('Pump_Speed')
            Flow_Rate= request.POST.get('Flow_Rate')
            pH_Level= request.POST.get('pH_Level')
            Chlorine_Level= request.POST.get('Chlorine_Level')
            Turbidity= request.POST.get('Turbidity')
            Temperature= request.POST.get('Temperature')
            Pressure= request.POST.get('Pressure')
            Operational_Status= request.POST.get('Operational_Status')
            Quality_Flag= request.POST.get('Quality_Flag')
            Sensor_ID= request.POST.get('Sensor_ID')
            

        models = []
        # Load the dataset to examine its structure
        # Reload the dataset
        file_path = 'CVAE_Based_Anomaly_dataset.csv'
        data = pd.read_csv(file_path)
        print(data.columns)
        # Encode categorical variables
        label_encoders = {}
        categorical_columns = ['Operational_Status', 'Quality_Flag', 'Sensor_ID']
        for col in categorical_columns:
            le = LabelEncoder()
            data[col] = le.fit_transform(data[col])
            label_encoders[col] = le

        # Separate features and labels
        X = data.drop(columns=['Label'])
        y = data['Label']
        y = LabelEncoder().fit_transform(y)  # Encode labels: Cyber Attack = 1, No Attack = 0

        # Split the dataset into training and testing sets
        X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

        # Scale numerical features
        scaler = StandardScaler()
        X_train = scaler.fit_transform(X_train)
        X_test = scaler.transform(X_test)
        # SVM Model
        print("SVM")
        from sklearn import svm

        lin_clf = svm.LinearSVC()
        lin_clf.fit(X_train, y_train)
        predict_svm = lin_clf.predict(X_test)
        svm_acc = accuracy_score(y_test, predict_svm) * 100
        print("ACCURACY")
        print(svm_acc)
        print("CLASSIFICATION REPORT")
        print(classification_report(y_test, predict_svm))
        print("CONFUSION MATRIX")
        print(confusion_matrix(y_test, predict_svm))
        models.append(('svm', lin_clf))

        print("RandomForestClassifier")
 

        reg = RandomForestClassifier(random_state=42).fit(X_train, y_train)
        y_pred = reg.predict(X_test)
        print("ACCURACY")
        print(accuracy_score(y_test, y_pred) * 100)
        print("CLASSIFICATION REPORT")
        print(classification_report(y_test, y_pred))
        print("CONFUSION MATRIX")
        print(confusion_matrix(y_test, y_pred))
        models.append(('RandomForestClassifier', reg))

        print("Gradient Boosting Classifier")
        gb_model = GradientBoostingClassifier()
        gb_model.fit(X_train, y_train)
        dtcpredict = gb_model.predict(X_test)
        print("ACCURACY")
        print(accuracy_score(y_test, dtcpredict) * 100)
        print("CLASSIFICATION REPORT")
        print(classification_report(y_test, dtcpredict))
        print("CONFUSION MATRIX")
        print(confusion_matrix(y_test, dtcpredict))
        models.append(('GradientBoostingClassifier', gb_model))

        # Input data for prediction
        input_data = pd.DataFrame([{
            'Pump_Speed': Pump_Speed, 
            'Flow_Rate': Pump_Speed, 
            'pH_Level': pH_Level, 
            'Chlorine_Level': Chlorine_Level, 
            'Turbidity': Turbidity, 
            'Temperature': Temperature, 
            'Pressure': Pressure, 
            'Operational_Status': Operational_Status, 
            'Quality_Flag': Quality_Flag, 
            'Sensor_ID': Sensor_ID
        }])
        print(input_data)
        # Encode and scale the input data
        for col in categorical_columns:
            input_data[col] = label_encoders[col].transform(input_data[col])

        scaled_input = scaler.transform(input_data)

        # Predict using Random Forest (best performing model)
        prediction = reg.predict(scaled_input)
        predicted_label = "Cyber Attack" if prediction[0] == 0 else "No Attack"
        print(predicted_label)

        print(predicted_label) 
        
         
        Water_Distribution_Attacks.objects.create(
        Pump_Speed=Pump_Speed,
        Flow_Rate=Flow_Rate,
        pH_Level=pH_Level,
        Chlorine_Level=Chlorine_Level,
        Turbidity=Turbidity,
        Temperature=Temperature,
        Pressure=Pressure,
        Operational_Status=Operational_Status,
        Quality_Flag=Quality_Flag,
        Sensor_ID=Sensor_ID,        
        Prediction=predicted_label)

        return render(request, 'RUser/Predict_Water_Distribution_Attacks.html',{'objs': predicted_label})
    return render(request, 'RUser/Predict_Water_Distribution_Attacks.html')



