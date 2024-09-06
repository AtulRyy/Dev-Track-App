from ninja import ModelSchema
from pydantic import BaseModel
from ninja import Schema
from projects.models import ProjectModel, DomainModel


class CreateDomainSchema(Schema):
    name : str 
    description : str 


class ListDomainSchema(Schema):
    id : int 
    name : str


class ListProjectSchema(Schema):
    id : int
    name : str 
    domain : str
    created_at : str


class CreateProjectSchema(Schema):
    name : str 
    domain_id : int  
    github_link : str 
    youtube_link : str 


