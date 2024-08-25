from django.db import models
from enumfields import Enum, EnumField
from members.models import CustomUser

# Create your models here.


class DomainModel(models.Model):
    name = models.CharField(max_length= 32)
    description = models.CharField(max_length= 256)


class ProjectModel(models.Model):
    name = models.CharField(max_length= 64)
    description = models.CharField(max_length= 256)
    domain = models.ForeignKey(DomainModel,on_delete=models.CASCADE)
    github_link = models.URLField(blank=False)
    youtube_link = models.URLField(blank=True, null =True)
    pdf_report = models.FileField(upload_to="/", blank =True, null=True)
    created_at = models.DateTimeField(auto_now_add= True)
    created_by = models.ForeignKey(CustomUser,on_delete=models.CASCADE)

#Dont forget to make file model and set it up.(B)

class TeamModel(models.Model):
    project=models.ForeignKey(ProjectModel)
    name=models.CharField(max_length=50)
    
class UserRole(Enum):
    LEAD='lead'
    MEMBER='member'

class TeamMembersModel(models.Model):
    team=models.ForeignKey(TeamModel,on_delete=models.CASCADE)
    user=models.ForeignKey(CustomUser,on_delete=models.CASCADE)
    role=EnumField(UserRole,default=UserRole.MEMBER)

class ProgressModel(models.Model):
    team_member=models.ForeignKey(TeamModel)
    week_number=models.IntegerField(max_length=7)
    learning_outcome=models.TextField(max_length=200)
    update_at=models.DateTimeField(auto_now_add= True)
    

class ScrumMeetmodel(models.model):
    project_id = models.ForeignKey(ProjectModel)
    join_link = models.URLField(blank=True,null=True)

    
