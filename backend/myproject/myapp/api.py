from ninja import NinjaAPI
from ninja.security import django_auth
from django.contrib.auth import authenticate, login, logout
from django.middleware.csrf import get_token
from .models import CustomUser as User
from . import schemas
from django.http import JsonResponse
from django.shortcuts import get_object_or_404



api = NinjaAPI(csrf=True)


@api.get("/set-csrf-token")
def get_csrf_token(request):
    return {"csrftoken": get_token(request)}


@api.post("/login")
def login_view(request, payload: schemas.SignInSchema):
    user = authenticate(request, username=payload.email, password=payload.password)
    if user is not None:
        login(request, user)
        return {"success": True}
    return {"success": False, "message": "Invalid credentials"}


@api.post("/logout", auth=django_auth)
def logout_view(request):
    logout(request)
    return {"message": "Logged out"}


@api.get("/user", auth=django_auth,)
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
        return JsonResponse({"success": "User registered successfully"}, status=201)
    except Exception as e:
        return JsonResponse({"error": str(e)}, status=400)


@api.put("/edit",auth=django_auth ,response=schemas.RegisterSchema)
def edit_profile(request, payload : schemas.RegisterSchema):
    user= get_object_or_404(User, srn=request.user.srn)
    for attr, value in payload.dict().items():
        setattr(user, attr, value)
    user.save()
    return user
    
