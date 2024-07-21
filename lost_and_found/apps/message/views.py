from django.shortcuts import render
from apps.message.models import Message
from apps.message.serializers import MessageSerializers
from apps.user.models import User
from apps.release.models import Release
from utils import resultful
from django.core import serializers
import json


def insert_message(request):
    if request.method == "POST":
        data = json.loads(request.body.decode())

        content = data.get("content")
        pid = data.get("pid")  # 留言id
        if data.get("pid") is None:
            pid = 0
        if data.get("to_user_id") is None or data.get("to_user_id") == 0:
            Message.objects.create(
                release=Release.objects.get(id=data.get("release_id")),
                user=User.objects.get(id=data.get("user_id")),
                pid=pid,
                content=content
            )
        else:
            Message.objects.create(
                release=Release.objects.get(id=data.get("release_id")),
                user=User.objects.get(id=data.get("user_id")),
                to_user=User.objects.get(id=data.get("to_user_id")),
                pid=pid,
                content=content
            )

        return resultful.ok(
            message="留言成功!"
        )
    else:
        return resultful.method_error("请求方法错误")


# 获取发布内容的所有留言信息
def get_message(request):
    if request.method == "GET":
        release_id = request.GET.get("release_id")
        m = Message.objects.filter(release_id=release_id).order_by("-created_at")

        return resultful.ok(data=MessageSerializers(m, many=True).data, message="成功")
    else:
        return resultful.method_error("请求方法错误")
