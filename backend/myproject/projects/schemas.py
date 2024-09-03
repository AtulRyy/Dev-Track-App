from ninja import ModelSchema
from pydantic import BaseModel
from ninja import Schema
from projects.models import ProjectModel


class ListProjectSchema(Schema):
    name : str 
    domain : str
    created_at : str


class CreateProjectSchema(Schema):
    name : str 
    github_link : str 
    youtube_link : str 
    domain : str 

