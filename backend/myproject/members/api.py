from django.contrib.auth import authenticate, logout
from .models import CustomUser as User
from . import schemas
from django.http import JsonResponse
from django.shortcuts import get_object_or_404
from ninja_jwt.controller import NinjaJWTDefaultController
from ninja_jwt.authentication import JWTAuth
from ninja_jwt.tokens import RefreshToken
from ninja_extra import NinjaExtraAPI, ControllerBase, api_controller, route

from projects.api import ProjectsAPI


@api_controller("/user", tags="User Authentication", auth=JWTAuth())
class UserAuthAPI(ControllerBase):

    # API call for user to login by giving username and password. JWT based session will be created after this.
    @route.post("/login", url_name="User login", auth=None)
    def login_view(self, request, payload: schemas.SignInSchema):
        user = authenticate(request, username=payload.email, password=payload.password)
        if user is not None:
            refresh = RefreshToken.for_user(user)
            return {"refresh": str(refresh), "access": str(refresh.access_token)}
        return JsonResponse({"detail": "Invalid credentials"}, status=401)

    # API call made by a user to logout., auth=JWTAuth()
    @route.post("/logout", auth=None)
    def logout_view(self, request):
        logout(request)
        return {"message": "Logged out"}

    # API call made by user to view their profile.
    @route.get("/user", auth=JWTAuth())
    def user(self, request):
        return {
            "username": request.user.username,
            "email": request.user.email,
            "github": request.user.github,
            "fname": request.user.fname,
        }

    # API post request for a new user to create a new account.
    @route.post("/register", auth=None)
    def register(self, request, payload: schemas.RegisterSchema):
        try:
            user = User.objects.create_user(
                username=payload.email,
                email=payload.email,
                password=payload.password,
                first_name=payload.first_name,
                last_name=payload.last_name,
            )
            refresh = RefreshToken.for_user(user)
            return {
                "refresh": str(refresh),
                "access": str(refresh.access_token),
            }
        except Exception as e:
            return JsonResponse({"error": str(e)}, status=400)

    @route.put("/edit", auth=JWTAuth(), response=schemas.RegisterSchema)
    def edit_profile(self, request, payload: schemas.RegisterSchema):
        user = get_object_or_404(User, srn=request.user.srn)
        for attr, value in payload.dict().items():
            setattr(user, attr, value)
        user.save()
        return user


api = NinjaExtraAPI(csrf=False)
api.register_controllers(NinjaJWTDefaultController)
api.register_controllers(UserAuthAPI)
api.register_controllers(ProjectsAPI)
