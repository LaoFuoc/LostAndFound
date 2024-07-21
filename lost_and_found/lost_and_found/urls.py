"""lost_and_found URL Configuration

The `urlpatterns` list routes URLs to  For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import include, path
from .views import *
from django.conf.urls.static import static
from django.conf import settings

app_name = ""
urlpatterns = [
                  path('admin/', admin.site.urls),
                  path('release/', include('apps.release.urls')),
                  path('message/', include('apps.message.urls')),
                  path('user/', include('apps.user.urls')),

                  path('index', index, name="index"),
                  path('', index, name="index"),
                  path('found', release_list, name="found"),
                  path('lost', release_list, name="lost"),
                  path('detail', detail, name="detail"),
                  path('center', center, name="center"),
                  path('login', login, name="login"),
                  path('publish', publish, name="publish"),
              ] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
