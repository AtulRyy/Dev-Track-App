# Generated by Django 5.0.7 on 2024-08-12 05:54

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('members', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='customuser',
            name='srn',
            field=models.CharField(max_length=8),
        ),
    ]
