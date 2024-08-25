from django.db import models

from members.models import CustomUser
# Create your models here.


class NotificationModel(models.Model):
    message = models.CharField()
    created_at = models.DateTimeField(auto_now_add=True)
    is_read = models.BooleanField()
    user = models.ForeignKey(CustomUser)


class AnnouncementModel: 
    title = models.CharField(max_length=512)
    content = models.CharField(max_length=512)
    created_at = models.DateTimeField(auto_now_add=True)
    created_by = models.ForeignKey(CustomUser)


