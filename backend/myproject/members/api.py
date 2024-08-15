from ninja import NinjaAPI
from django.contrib.auth import authenticate, login, logout
from .models import CustomUser as User
from . import schemas
from django.http import JsonResponse
from django.shortcuts import get_object_or_404
from ninja_jwt.controller import NinjaJWTDefaultController
from ninja_jwt.authentication import JWTAuth
from ninja_jwt.tokens import RefreshToken
from ninja_extra import NinjaExtraAPI


api = NinjaExtraAPI(csrf=False)
api.register_controllers(NinjaJWTDefaultController)



@api.post("/login")
def login_view(request, payload: schemas.SignInSchema):
    user = authenticate(request, username=payload.email, password=payload.password)
    if user is not None:
        refresh= RefreshToken.for_user(user)
        return {
            'refresh': str(refresh),
            'access': str(refresh.access_token)
        }
    return JsonResponse({"detail": "Invalid credentials"}, status=401)


@api.post("/logout", auth=JWTAuth())
def logout_view(request):
    logout(request)
    return {"message": "Logged out"}


@api.get("/user", auth=JWTAuth())
def user(request):
    return {
        "username": request.user.username,
        "email": request.user.email,
        "github": request.user.github,
        "fname" : request.user.fname,
    }



@api.post("/register")
def register(request, payload: schemas.RegisterSchema):
    try:
        User.objects.create_user(
            username=payload.email, 
            email=payload.email, 
            password=payload.password,
            first_name= payload.first_name,
            last_name= payload.last_name,
        )
        refresh = RefreshToken.for_user(user)
        return {
            "refresh": str(refresh),
            "access": str(refresh.access_token),
        }
    except Exception as e:
        return JsonResponse({"error": str(e)}, status=400)
    
    

@api.put("/edit", auth=JWTAuth() ,response=schemas.RegisterSchema)
def edit_profile(request, payload : schemas.RegisterSchema):
    user= get_object_or_404(User, srn=request.user.srn)
    for attr, value in payload.dict().items():
        setattr(user, attr, value)
    user.save()
    return user
    

