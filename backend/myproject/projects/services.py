from django.core.files.storage import default_storage

from .models import ProjectModel
from .schemas import CreateProjectSchema, ListProjectSchema


class ProjectService:   

    def create_project(self, details : CreateProjectSchema, pdf_file):
        try:
            new = ProjectModel(
                name = details.name, 
                github_link = details.github_link,
                youtube_link = details.youtube_link, 
                domain = details.domain,
            )

            if pdf_file:
                file_path = default_storage.save()

            new.save()

            if pdf_file:
                file_path = default_storage.save(f'projects/{pdf_file.name}', pdf_file)
                new.pdf_file = file_path  
                new.save()

            return {"message": "Project created successfully", "project_id": new.id}

        except Exception as e:
                return {"error": str(e)}