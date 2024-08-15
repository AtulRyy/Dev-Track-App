from django.contrib.auth.models import AbstractUser
from django.db import models


class CustomUser(AbstractUser):

    # alt_email = models.EmailField(unique=True,)
    phone = models.CharField(max_length=10,)
    srn = models.CharField(max_length=8)
    branch = models.CharField(max_length=50,)
    semester = models.CharField(max_length=2, default='1')
    github = models.URLField(default='')
    linkedin = models.URLField( default='')

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = [
        'username',
        'first_name',
        'last_name',
        'alt_email',
        'phone',
        'srn', 
        'branch',
        'semester',
        'github',
        'linkedin',
        'password',
    ]

    def __str__(self):
        return self.email
