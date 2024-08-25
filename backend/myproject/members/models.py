#Django imports
from django.contrib.auth.models import AbstractUser
from django.db import models
from pydantic import ValidationError

#Model imports
from projects.models import ProjectModel, SubmissionModel 

# Todo list 
# - Manage passwords, search how to do that
# - Reset password functionality



#User details table with authentication. 
class CustomUser(AbstractUser):
    email = models.EmailField(unique=True)
    phone = models.CharField(max_length=10)
    srn = models.CharField(max_length=8)
    branch = models.CharField(max_length=50)
    semester = models.CharField(max_length=2, default='1')
    github = models.URLField(default='', blank=True)
    linkedin = models.URLField(default='', blank=True)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username', 'first_name', 'last_name', 'phone', 'srn', 'branch', 'semester']

    def __str__(self):
        return self.email


#Table to upload all types of files : PDF, Images, Links
class FileModel(models.Model):
    PDF = "PD"
    IMAGE = "IM"
    LINK = "LI"

    FILE_TYPE = [
        (PDF,"pdf"),
        (IMAGE,"image"),
        (LINK,"link"),
    ]

    name = models.CharField(max_length=200,unique=True)
    type = models.CharField(max_length=2, choices=FILE_TYPE)
    file = models.FileField(upload_to='files/', null=True, blank=True) 
    image = models.ImageField(upload_to='images/', null=True, blank=True)  
    url = models.URLField(max_length=500, null=True, blank=True)  
    uploaded_at = models.DateTimeField(auto_now_add=True, db_index=True)
    uploaded_by = models.ForeignKey(CustomUser, on_delete=models.CASCADE, null=True, blank=True)
    related_project = models.ForeignKey(ProjectModel,on_delete=models.CASCADE, null=True, blank=True)
    related_submission = models.ForeignKey(SubmissionModel, on_delete=models.CASCADE,null=True, blank=True)
    related_user = models.ForeignKey(CustomUser, on_delete=models.CASCADE,null=True, blank=True)


    def clean(self):
        # Validate that the correct file type is provided
        if self.type == self.PDF and not self.file.name.endswith('.pdf'):
            raise ValidationError('File must be a PDF.')
        elif self.type == self.IMAGE and not self.image.name.endswith(('.jpg', '.jpeg', '.png', '.gif')):
            raise ValidationError('Image must be a valid image file.')
        elif self.type == self.LINK and not self.url:
            raise ValidationError('URL must be provided for a link type.')
        super().clean()

    def __str__(self):
        return self.name