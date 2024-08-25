#Django imports
from django.db import models
from enumfields import Enum, EnumField

#Model imports
from members.models import CustomUser, FileModel




class DomainModel(models.Model):
    name = models.CharField(max_length= 100)
    description = models.TextField(max_length= 256)



class ProjectModel(models.Model):
    ONGOING = "ON"
    PAST = "PA"

    STATUS_ROLES = [
        (ONGOING, "ongoing"),
        (PAST, "past")
    ]


    name = models.CharField(max_length= 64)
    description = models.TextField(max_length= 256)
    github_link = models.URLField(blank=False, null=True, blank=True)
    youtube_link = models.URLField(blank=True, null =True, blank=True)
    status = models.CharField(choices=STATUS_ROLES)
    created_at = models.DateTimeField(auto_now_add= True)
    team = models.ForeignKey(TeamModel,on_delete=models.CASCADE)
    pdf_report = models.ForeignKey(FileModel, on_delete=models.CASCADE, null=True)
    domain = models.ForeignKey(DomainModel,on_delete=models.CASCADE)
    

class SubmissionModel(models.Model):
    project = models.ForeignKey(ProjectModel, on_delete=models.CASCADE, null=True, blank=True)
    team = models.ForeignKey(Team)


   
class TeamModel(models.Model):
    project=models.ForeignKey(ProjectModel)
    name=models.CharField(max_length=50)
 


class ScrumModel(models.model):
    meeting_link = models.URLField(max_length=500)
    domain = models.ForeignKey(DomainModel,on_delete=models.CASCADE)
    scheduled_time = models.DateField()
    

    

# class ProgressModel(models.Model):
#     team_member=models.ForeignKey(TeamModel)
#     week_number=models.IntegerField(max_length=7)
#     learning_outcome=models.TextField(max_length=200)
#     update_at=models.DateTimeField(auto_now_add= True)
    

