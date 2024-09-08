from ninja import ModelSchema
from pydantic import BaseModel
from ninja import Schema
from projects.models import ProjectModel, DomainModel
from django import forms
from ninja import File, Form, UploadedFile
from typing import Optional


class CreateDomainSchema(Schema):
    name: str
    description: str


class ListDomainSchema(Schema):
    id: int
    name: str


class ListProjectSchema(Schema):
    id: int
    name: str
    domain: str
    created_at: str


class EditProjectSchema(BaseModel):
    name: Optional[str] = None
    domain_id: Optional[int] = None
    github_link: Optional[str] = None
    youtube_link: Optional[str] = None


class CreateProjectSchema(Schema):
    name: str
    domain_id: int
    github_link: str
    youtube_link: str
