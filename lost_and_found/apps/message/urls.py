from django.urls import path

from . import views

urlpatterns = [
    path('insert', views.insert_message, name="insert_message"),
    path('get', views.get_message, name="get_message"),
]
