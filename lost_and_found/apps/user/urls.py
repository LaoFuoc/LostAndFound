from django.urls import path

from . import views

urlpatterns = [
    path('login', views.login, name="login"),
    path('register', views.register, name="register"),
    path('update', views.update_user, name="update_user"),
    path('update_pwd', views.update_pwd, name="update_pwd"),
]
