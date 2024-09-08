from . import schemas
from django.shortcuts import get_object_or_404
from django.http import JsonResponse
from ninja_jwt.authentication import JWTAuth
from ninja_jwt.tokens import RefreshToken
from ninja_extra import NinjaExtraAPI, ControllerBase, api_controller, route
from ninja_jwt.controller import NinjaJWTDefaultController
from ninja import File, Form, UploadedFile, Body
from ninja.errors import HttpError
from datetime import datetime
import logging
from typing import Optional

from .services import ProjectService, DomainService
from .schemas import (
    ListProjectSchema,
    CreateDomainSchema,
    ListDomainSchema,
    CreateProjectSchema,
    EditProjectSchema,
)
from .models import ProjectModel, DomainModel


@api_controller("/projects", tags="Projects")
class ProjectsAPI(ControllerBase):

    def __init__(self) -> None:
        self.project_service = ProjectService()
        self.domain_service = DomainService()

    # API call to create domain.
    @route.post("/domain/create", url_name="Create domain")
    def create_domain(self, payload: schemas.CreateDomainSchema):
        response = self.domain_service.create_domain(payload)
        if "error" in response:
            raise HttpError(400, response["error"])
        return response

    # API call to list the existing domains.
    @route.get(
        "/domains/list", url_name="List domains", response=list[ListDomainSchema]
    )
    def list_domain(self, request):
        try:
            domains = DomainModel.objects.all()
            domain_list = [
                ListDomainSchema(id=domain.id, name=domain.name) for domain in domains
            ]
            return domain_list
        except Exception as e:
            raise HttpError(400, str(e))

    # API call to create a new project
    @route.post("/create", url_name="Create project")
    def create_project(
        self, payload: schemas.CreateProjectSchema, file: UploadedFile = File(...)
    ):
        response = self.project_service.create_project(payload, file)
        if "error" in response:
            raise HttpError(400, response["error"])
        return {
            "message": "Project created successfully",
            "project_id": response["data"]["project_id"],
        }

    # Api to list all the names of the projects.
    @route.get("/list", url_name="List Projects", response=list[ListProjectSchema])
    def list_projects(self, request):
        try:
            projects = ProjectModel.objects.all()
            project_list = [
                ListProjectSchema(
                    id=project.id,
                    name=project.name,
                    domain=project.domain.name,
                    created_at=project.created_at.isoformat(),
                )
                for project in projects
            ]
            return project_list
        except Exception as e:
            raise HttpError(400, str(e))

    # API call to edit a project.
    @route.put(
        "/edit/{project_id}", url_name="Edit project"
    )  # TODO fix the file.
    def edit_project(
        self,
        project_id: int,
        payload: EditProjectSchema,
        file: Optional[UploadedFile] = None,
    ):
        response = self.project_service.edit_project(
            project_id, details=payload, pdf_file=file
        )
        if "error" in response:
            raise HttpError(400, response["error"])
        return {"message": "Successfully edited the project.", "status": 201}

    # API call to delete a project.
    @route.delete(
        "/delete/{project_id}",
        url_name="Delete project",
    )
    def delete_project(self, project_id: int):
        try:
            to_delete = get_object_or_404(ProjectModel, id=project_id)
            name_to_display = to_delete.name
            to_delete.delete()
            return {"message": f"{name_to_display} has successfully been deleted."}

        except Exception as e:
            raise HttpError(400, str(e))
