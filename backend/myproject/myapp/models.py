from django.contrib.auth.models import AbstractUser
from django.db import models


class CustomUser(AbstractUser):
    # email = models.EmailField(unique=True, default='default@example.com')
    # fname = models.CharField(max_length=30, default='First Name')
    # lname = models.CharField(max_length=30, default='Last Name')
    # alt_email = models.EmailField(unique=True,)
    phone = models.CharField(max_length=10,)
    srn = models.CharField(max_length=8, unique=True)
    branch = models.CharField(max_length=50,)
    semester = models.CharField(max_length=2, default='1')
    github = models.URLField(default='')
    linkedin = models.URLField( default='')
    # password= models.CharField(max_length=100)
    

    # USERNAME_FIELD = 'email'
    # REQUIRED_FIELDS = [
    #     'username',
    #     'fname',
    #     'lname',
    #     'alt_email',
    #     'phone',
    #     'srn', 
    #     'branch',
    #     'semester',
    #     'github',
    #     'linkedin',
    #     'password',
    # ]

    def __str__(self):
        return self.email
