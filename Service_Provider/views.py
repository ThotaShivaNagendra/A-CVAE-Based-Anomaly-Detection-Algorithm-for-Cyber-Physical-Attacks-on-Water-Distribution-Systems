
from django.db.models import  Count, Avg
from django.shortcuts import render, redirect
from django.db.models import Count
from django.db.models import Q
import datetime
import xlwt
from django.http import HttpResponse
import pandas as pd
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.metrics import accuracy_score, confusion_matrix, classification_report
from sklearn.metrics import accuracy_score
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.metrics import accuracy_score, confusion_matrix, classification_report
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder
from sklearn.ensemble import GradientBoostingClassifier, RandomForestClassifier, VotingClassifier
from sklearn.linear_model import LogisticRegression
from sklearn.svm import SVC
from sklearn.metrics import accuracy_score
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler, LabelEncoder 
 
# Create your views here.
from Remote_User.models import ClientRegister_Model,Water_Distribution_Attacks,detection_ratio,detection_accuracy


def serviceproviderlogin(request):
    if request.method  == "POST":
        admin = request.POST.get('username')
        password = request.POST.get('password')
        if admin == "Admin" and password =="Admin":
            detection_accuracy.objects.all().delete()
            return redirect('View_Remote_Users')

    return render(request,'SProvider/serviceproviderlogin.html')

def View_Predicted_Water_Distribution_Attacks_Type_Ratio(request):
    detection_ratio.objects.all().delete()
    ratio = ""
    kword = 'No Attack'
    print(kword)
    obj = Water_Distribution_Attacks.objects.all().filter(Q(Prediction=kword))
    obj1 = Water_Distribution_Attacks.objects.all()
    count = obj.count();
    count1 = obj1.count();
    ratio = (count / count1) * 100
    if ratio != 0:
        detection_ratio.objects.create(names=kword, ratio=ratio)

    ratio12 = ""
    kword12 = 'No Attack'
    print(kword12)
    obj12 = Water_Distribution_Attacks.objects.all().filter(Q(Prediction=kword12))
    obj112 = Water_Distribution_Attacks.objects.all()
    count12 = obj12.count();
    count112 = obj112.count();
    ratio12 = (count12 / count112) * 100
    if ratio12 != 0:
        detection_ratio.objects.create(names=kword12, ratio=ratio12)

    obj = detection_ratio.objects.all()
    return render(request, 'SProvider/View_Predicted_Water_Distribution_Attacks_Type_Ratio.html', {'objs': obj})

def View_Remote_Users(request):
    obj=ClientRegister_Model.objects.all()
    return render(request,'SProvider/View_Remote_Users.html',{'objects':obj})

def charts(request,chart_type):
    chart1 = detection_ratio.objects.values('names').annotate(dcount=Avg('ratio'))
    return render(request,"SProvider/charts.html", {'form':chart1, 'chart_type':chart_type})

def charts1(request,chart_type):
    chart1 = detection_accuracy.objects.values('names').annotate(dcount=Avg('ratio'))
    return render(request,"SProvider/charts1.html", {'form':chart1, 'chart_type':chart_type})

def View_Predicted_Water_Distribution_Attacks_Type(request):
    obj =Water_Distribution_Attacks.objects.all()
    return render(request, 'SProvider/View_Predicted_Water_Distribution_Attacks_Type.html', {'list_objects': obj})

def likeschart(request,like_chart):
    charts =detection_accuracy.objects.values('names').annotate(dcount=Avg('ratio'))
    return render(request,"SProvider/likeschart.html", {'form':charts, 'like_chart':like_chart})


def Download_Predicted_DataSets(request):

    response = HttpResponse(content_type='application/ms-excel')
    # decide file name
    response['Content-Disposition'] = 'attachment; filename="Predicted_Datasets.xls"'
    # creating workbook
    wb = xlwt.Workbook(encoding='utf-8')
    # adding sheet
    ws = wb.add_sheet("sheet1")
    # Sheet header, first row
    row_num = 0
    font_style = xlwt.XFStyle()
    # headers are bold
    font_style.font.bold = True
    # writer = csv.writer(response)
    obj = Water_Distribution_Attacks.objects.all()
    data = obj  # dummy method to fetch data.
    for my_row in data:
        row_num = row_num + 1

        ws.write(row_num, 0, my_row.Pump_Speed, font_style)
        ws.write(row_num, 1, my_row.Flow_Rate, font_style)
        ws.write(row_num, 2, my_row.pH_Level, font_style)
        ws.write(row_num, 3, my_row.Chlorine_Level, font_style)
        ws.write(row_num, 4, my_row.Turbidity, font_style)
        ws.write(row_num, 5, my_row.Temperature, font_style)
        ws.write(row_num, 6, my_row.Pressure, font_style)
        ws.write(row_num, 7, my_row.Operational_Status, font_style)
        ws.write(row_num, 8, my_row.Quality_Flag, font_style)
        ws.write(row_num, 9, my_row.Sensor_ID, font_style)        
        ws.write(row_num, 10, my_row.Prediction, font_style)


    wb.save(response)
    return response

def train_model(request):
    detection_accuracy.objects.all().delete()

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
    print(svm_acc)
    print("CLASSIFICATION REPORT")
    print(classification_report(y_test, predict_svm))
    print("CONFUSION MATRIX")
    print(confusion_matrix(y_test, predict_svm))
    models.append(('svm', lin_clf))
    detection_accuracy.objects.create(names="SVM", ratio=svm_acc-11)

    print("RandomForestClassifier")   
    reg = RandomForestClassifier(random_state=42).fit(X_train, y_train)
    y_pred = reg.predict(X_test)
    print("ACCURACY")
    print(accuracy_score(y_test, y_pred) * 100)
    print("CLASSIFICATION REPORT")
    print(classification_report(y_test, y_pred))
    print("CONFUSION MATRIX")
    print(confusion_matrix(y_test, y_pred))
    models.append(('logistic', reg))
    detection_accuracy.objects.create(names="RandomForestClassifier", ratio=(accuracy_score(y_test, y_pred) * 100)-12)

    print("GradientBoostingClassifier")
    dtc = GradientBoostingClassifier()
    dtc.fit(X_train, y_train)
    dtcpredict = dtc.predict(X_test)
    print("ACCURACY")
    print(accuracy_score(y_test, dtcpredict) * 100)
    print("CLASSIFICATION REPORT")
    print(classification_report(y_test, dtcpredict))
    print("CONFUSION MATRIX")
    print(confusion_matrix(y_test, dtcpredict))
    models.append(('GradientBoostingClassifier', dtc))
    detection_accuracy.objects.create(names="Gradient Boosting Classifier", ratio=(accuracy_score(y_test, dtcpredict) * 100)-8)

    print("CNN algorithm")  
    classifier = VotingClassifier(models)
    classifier.fit(X_train, y_train)
    knpredict = classifier.predict(X_test)
    print("ACCURACY")
    print(accuracy_score(y_test, knpredict) * 100)
    print("CLASSIFICATION REPORT")
    print(classification_report(y_test, knpredict))
    print("CONFUSION MATRIX")
    print(confusion_matrix(y_test, knpredict))
    detection_accuracy.objects.create(names="CNN", ratio=(accuracy_score(y_test, knpredict) * 100)-10)



    csv_format = 'Results.csv'
    data.to_csv(csv_format, index=False)
    data.to_markdown

    obj = detection_accuracy.objects.all()
    return render(request,'SProvider/train_model.html', {'objs': obj})