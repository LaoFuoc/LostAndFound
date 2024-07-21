import json

from django.shortcuts import render
from apps.release.models import Release
from apps.message.models import Message
from apps.user.models import User
from utils import resultful
from apps.message.serializers import MessageSerializers
from apps.release.form import ReleaseForm


def index(request):
    return render(request, 'index.html')


# todo 前端搜索展示还没做。


def release_list(request):
    if request.method == "GET":
        release_type = request.GET.get('type')
        r = Release.objects.filter(type=release_type).order_by("-created_at")
        context = {"data": r}
        if release_type == '1':
            return render(request, "found.html", context)
        elif release_type == '2':
            return render(request, "lost.html", context)
    else:
        return resultful.method_error("请求方法错误")


def detail(request):
    if request.method == "GET":
        id = request.GET.get('id')
        r = Release.objects.get(id=id)
        user_info = User.objects.get(id=r.user_id)

        m = Message.objects.filter(release_id=id).order_by("-created_at")

        data = MessageSerializers(m, many=True).data
        dict_data = json.loads(json.dumps(data))
        parent = []
        for item in dict_data:
            if item["pid"] == 0:
                item["children"] = []
                parent.append(item)
        for p in parent:
            for item in dict_data:
                if p["id"] == item["pid"]:
                    p["children"].append(item)

        context = {
            "data": r,
            "user_info": {
                "user_id": user_info.id,
                "nick_name": user_info.nick_name,
                "sex": user_info.sex,
                "phone": user_info.phone
            },
            "messages": parent
        }
        return render(request, "detail.html", context)
    else:
        return resultful.method_error("请求方法错误")


def center(request):
    if request.method == "GET":
        id = request.GET.get('id')
        user_info = User.objects.get(id=id)
        context = {"data": user_info}
        return render(request, 'center.html', context)
    else:
        return resultful.method_error("请求方法错误")


def login(request):
    return render(request, 'login_register.html')


def publish(request):
    if request.GET.get("id") is None or request.GET.get("id") == 0:
        r = {"id": 0}
        return render(request, 'publish.html', {'form': r})
    else:
        r = Release.objects.get(id=request.GET.get("id"))
        return render(request, 'publish.html', {'form': r})
