# Generated by Django 2.0 on 2025-01-11 09:13

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='ClientRegister_Model',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('username', models.CharField(max_length=30)),
                ('email', models.EmailField(max_length=30)),
                ('password', models.CharField(max_length=10)),
                ('phoneno', models.CharField(max_length=10)),
                ('country', models.CharField(max_length=30)),
                ('state', models.CharField(max_length=30)),
                ('city', models.CharField(max_length=30)),
                ('gender', models.CharField(max_length=30)),
                ('address', models.CharField(max_length=30)),
            ],
        ),
        migrations.CreateModel(
            name='detection_accuracy',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('names', models.CharField(max_length=300)),
                ('ratio', models.CharField(max_length=300)),
            ],
        ),
        migrations.CreateModel(
            name='detection_ratio',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('names', models.CharField(max_length=300)),
                ('ratio', models.CharField(max_length=300)),
            ],
        ),
        migrations.CreateModel(
            name='Water_Distribution_Attacks',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Pump_Speed', models.CharField(max_length=3000)),
                ('pH_Level', models.CharField(max_length=3000)),
                ('Chlorine_Level', models.CharField(max_length=3000)),
                ('Turbidity', models.CharField(max_length=3000)),
                ('Temperature', models.CharField(max_length=3000)),
                ('Pressure', models.CharField(max_length=3000)),
                ('Operational_Status', models.CharField(max_length=3000)),
                ('Quality_Flag', models.CharField(max_length=3000)),
                ('Prediction', models.CharField(max_length=3000)),
            ],
        ),
    ]
