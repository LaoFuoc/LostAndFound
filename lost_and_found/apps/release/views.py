from django.shortcuts import render, redirect

# Create your views here.
import json

from apps.message.serializers import MessageSerializers
from apps.release.models import Release
from apps.release.serializers import ReleaseSerializers
from apps.user.models import User
from lost_and_found.settings import STATIC_URL, MEDIA_ROOT
from utils import resultful
from django.core import serializers
from apps.message.models import Message
from django.http import HttpResponse
from django.core.files.storage import FileSystemStorage


def upsert_release(request):
    if request.method == "POST":
        id = request.POST.get("id")
        user = request.POST.get("user")
        user_obj = User.objects.get(id=user)
        name = request.POST.get("name")
        status = request.POST.get("status")
        if status == "on":
            status = "1"
        else:
            status = "0"
        desc = request.POST.get("desc")
        image = request.FILES.get("image")
        release_type = request.POST.get("release_type", "1")
        event_at = request.POST.get("event_at")
        event_place = request.POST.get("event_place")
        if id == '0' or id is None:
            # 新建
            r = Release.objects.create(
                user=user_obj, name=name, desc=desc, image=image, type=release_type, status=status,
                event_at=event_at, event_place=event_place
            )

            return redirect('/detail?id={}'.format(r.id))
        else:
            # 更新
            r = Release(id=id, name=name, desc=desc, image=image, status=status,
                        event_at=event_at, event_place=event_place)
            fields = ["name", "desc", "status", "event_at", "event_place", "updated_at"]
            if image is not None:
                fields.append("image")
            r.save(update_fields=fields)

            return redirect('/detail?id={}'.format(r.id))
    else:
        return resultful.method_error("请求方法错误")


def delete_release(request):
    if request.method == "DELETE":
        print(request.body.decode())
        data = json.loads(request.body.decode())
        release_id = data.get("id")
        r = Release.objects.get(id=release_id)
        r.delete()
        return resultful.ok("删除成功")
    else:
        return resultful.method_error("请求方法错误")


# 搜索
def search_release(request):
    if request.method == "GET":
        # release_type = request.GET.get('type')
        name = request.GET.get('name')
        data = Release.objects.filter(name__contains=name).order_by(
            "-created_at")
        return resultful.ok(data=ReleaseSerializers(data, many=True).data, message="成功")
    else:
        return resultful.method_error("请求方法错误")


# 列表页
def release_list(request):
    if request.method == "GET":
        release_type = request.GET.get('type')
        r = Release.objects.filter(type=release_type).order_by("-created_at")
        context = {"data": r}
        if release_type == 1:
            return render(request, "found.html", context)
        else:
            return render(request, "lost.html", context)
        # return resultful.ok(data=ReleaseSerializers(r, many=True).data, message="成功")
    else:
        return resultful.method_error("请求方法错误")
