from . import schemas
from django.shortcuts import get_object_or_404
from django.http import JsonResponse
from ninja_jwt.authentication import JWTAuth
from ninja_jwt.tokens import RefreshToken
from ninja_extra import NinjaExtraAPI, ControllerBase, api_controller, route 
from ninja_jwt.controller import NinjaJWTDefaultController
from ninja import File, Form, UploadedFile

from .services import ProjectService
from .schemas import ListProjectSchema
from .models import ProjectModel


@api_controller("/projects", tags="Projects")
class ProjectsAPI(ControllerBase):

    def __init__(self) -> None:
        self.project_service = ProjectService()


    #API call to create a new project
    @route.post("/create", url_name="Create project")
    def create_project(self, payload:schemas.CreateProjectSchema, file: UploadedFile = File(...)):
        response = self.project_service.create_project(payload,file)
        if 'error' in response:
            return JsonResponse(response, status=400)
        return JsonResponse(response, status=201)

    #Api to list all the names of the projects. 
    @route.get("/list", url_name="List Projects", response=list[ListProjectSchema])
    def list_projects(self,request):
        try: 
            projects = ProjectModel.objects.all()
            return projects
        except Exception as e:
            return JsonResponse({"Error":str(e)},status=400)



