from django.db import models
from members.models import CustomUser
from projects.models import DomainModel
# Create your models here.


class ApplicationsModel(models.Model):

    name  = models.CharField(max_length = 64)
    srn   = models.CharField(max_length=8)
    phone = models.IntegerField(max_length=10)
    project = models.URLField(blank=True, null=True)
    course = models.CharField(max_length=16)
    semester = models.IntegerField(max_length=2)
    first_preference = models.CharField()
    second_preference = models.CharField()
    linkedin_url = models.URLField(blank=True,null=True)
    github_url = models.URLField(blank=True,null=True)
    email_address =models.URLField(null=False)
    submitted_at = models.DateTimeField(auto_now_add=True)




# class ProjectCycleApplications(models.Model):
#     domain = models.ForeignKey(DomainModel)
#     user = models.ForeignKey(CustomUser)



