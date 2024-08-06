from django.contrib import admin
from django.urls import path, include 
from members.api import api

urlpatterns = [
    path('admin/', admin.site.urls),
    path("api/", api.urls),
]
