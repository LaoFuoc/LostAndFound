from django.urls import path

from . import views

app_name = "release"
urlpatterns = [
    path('delete', views.delete_release, name="delete_release"),
    path('upsert', views.upsert_release, name="upsert_release"),
    path('search', views.search_release, name="search_release"),
    path('list', views.release_list, name="release_list"),
]
