from ninja import ModelSchema
from .models import CustomUser
from pydantic import BaseModel
from ninja import Schema


class SignInSchema(BaseModel):
    email: str
    password: str


class RegisterSchema(ModelSchema):
    class Meta:
        model = CustomUser
        fields = [
            "email",
            "first_name",
            "last_name",
            "password",
            "srn",
        ]
