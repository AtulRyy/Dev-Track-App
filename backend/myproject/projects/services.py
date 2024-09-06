from django.core.files.storage import default_storage

from .models import ProjectModel
from .schemas import CreateProjectSchema, ListProjectSchema, CreateDomainSchema, ListDomainSchema
from members.models import FileModel
from projects.models import DomainModel


class ProjectService:   

    def create_project(self, details : CreateProjectSchema, pdf_file):
        try:
            try:
                domain = DomainModel.objects.get(id=details.domain_id)
            except DomainModel.DoesNotExist:
                return {"error": "Domain not found"}
            
            new_project = ProjectModel(
                name = details.name, 
                github_link = details.github_link,
                youtube_link = details.youtube_link, 
                domain = domain,
            )
            new_project.save()

            if pdf_file:
                file_path = default_storage.save(f'projects/{pdf_file.name}', pdf_file)
                file_instance = FileModel.objects.create(
                    name = pdf_file.name,
                    type = FileModel.PDF,
                    file = file_path,
                    related_project = new_project
                )  
                new_project.pdf_report = file_instance
                new_project.save()

            return {"message": "Project created successfully", "data": {"project_id": new_project.id}}

        except Exception as e:
                return {"error": str(e)}
        

class DomainService:
     
    #Service to create a new domain
    def create_domain(self,payload : CreateDomainSchema):
        try:
            response =  DomainModel.objects.create(
                 name = payload.name,
                 description = payload.description
            )
            return {"Success":"domain has been created"}
        except Exception as e:
            return {"error": str(e)}
        
    