from django.core.files.storage import default_storage
from django.shortcuts import get_object_or_404
from ninja import UploadedFile
from typing import Optional


from .models import ProjectModel
from .schemas import (
    CreateProjectSchema,
    ListProjectSchema,
    CreateDomainSchema,
    ListDomainSchema,
    EditProjectSchema,
)
from members.models import FileModel
from projects.models import DomainModel


class ProjectService:

    # Method to create a new project in database.
    def create_project(self, details: CreateProjectSchema, pdf_file):
        try:
            try:
                domain = DomainModel.objects.get(id=details.domain_id)
            except DomainModel.DoesNotExist:
                return {"error": "Domain not found"}

            new_project = ProjectModel(
                name=details.name,
                github_link=details.github_link,
                youtube_link=details.youtube_link,
                domain=domain,
            )
            new_project.save()

            if pdf_file:
                file_path = default_storage.save(f"projects/{pdf_file.name}", pdf_file)
                file_instance = FileModel.objects.create(
                    name=pdf_file.name,
                    type=FileModel.PDF,
                    file=file_path,
                    related_project=new_project,
                )
                new_project.pdf_report = file_instance
                new_project.save()

            return {
                "message": "Project created successfully",
                "data": {"project_id": new_project.id},
            }

        except Exception as e:
            return {"error": str(e)}

    # Method to edit an existing proejct.
    def edit_project(
        self,
        project_id: int,
        details: EditProjectSchema,
        pdf_file: Optional[UploadedFile] = None,
    ):
        try:
            project_to_edit = get_object_or_404(ProjectModel, id=project_id)
            print(f"{details}")

            # Update fields only if provided
            if details.name is not None:
                project_to_edit.name = details.name
            if details.github_link is not None:
                project_to_edit.github_link = details.github_link
            if details.youtube_link is not None:
                project_to_edit.youtube_link = details.youtube_link

            # Handle domain change
            if (
                details.domain_id is not None
                and project_to_edit.domain.id != details.domain_id
            ):
                try:
                    new_domain = DomainModel.objects.get(id=details.domain_id)
                    project_to_edit.domain = new_domain
                except DomainModel.DoesNotExist:
                    return {"error": "Domain not found"}

            # Handle file update
            if pdf_file:
                if project_to_edit.pdf_report:
                    # Deleting the old file
                    old_file_path = project_to_edit.pdf_report.file.path
                    default_storage.delete(old_file_path)
                    project_to_edit.pdf_report.delete()

                # Creating and saving the new file
                file_path = default_storage.save(f"projects/{pdf_file.name}", pdf_file)
                file_instance = FileModel.objects.create(
                    name=pdf_file.name,
                    type=FileModel.PDF,
                    file=file_path,
                    related_project=project_to_edit,
                )
                project_to_edit.pdf_report = file_instance

            project_to_edit.save()
            return {
                "message": "Project updated successfully",
                "data": {"project_id": project_to_edit.id},
            }

        except Exception as e:
            return {"error": str(e)}


class DomainService:

    # Service to create a new domain
    def create_domain(self, payload: CreateDomainSchema):
        try:
            response = DomainModel.objects.create(
                name=payload.name, description=payload.description
            )
            return {"Success": "domain has been created"}
        except Exception as e:
            return {"error": str(e)}
