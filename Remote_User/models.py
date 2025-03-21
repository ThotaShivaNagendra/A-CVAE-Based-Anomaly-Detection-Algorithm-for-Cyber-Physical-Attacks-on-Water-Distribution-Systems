from django.db import models

# Create your models here.
from django.db.models import CASCADE


class ClientRegister_Model(models.Model):
    username = models.CharField(max_length=30)
    email = models.EmailField(max_length=30)
    password = models.CharField(max_length=10)
    phoneno = models.CharField(max_length=10)
    country = models.CharField(max_length=30)
    state = models.CharField(max_length=30)
    city = models.CharField(max_length=30)
    gender= models.CharField(max_length=30)
    address= models.CharField(max_length=30)


class Water_Distribution_Attacks(models.Model):

    Pump_Speed= models.CharField(max_length=3000)
    Flow_Rate= models.CharField(max_length=3000)
    pH_Level= models.CharField(max_length=3000)
    Chlorine_Level= models.CharField(max_length=3000)
    Turbidity= models.CharField(max_length=3000)
    Temperature= models.CharField(max_length=3000)
    Pressure= models.CharField(max_length=3000)
    Operational_Status= models.CharField(max_length=3000)
    Quality_Flag= models.CharField(max_length=3000)
    Sensor_ID= models.CharField(max_length=3000)   
    Prediction= models.CharField(max_length=3000)

class detection_accuracy(models.Model):

    names = models.CharField(max_length=300)
    ratio = models.CharField(max_length=300)

class detection_ratio(models.Model):

    names = models.CharField(max_length=300)
    ratio = models.CharField(max_length=300)



