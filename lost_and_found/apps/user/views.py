import json
from apps.user.serializers import UserSerializers
from apps.user.models import User
from utils import resultful
from django.db.utils import IntegrityError


def login(request):
    if request.method == "POST":
        data = json.loads(request.body.decode())
        user_name = data.get("user_name")
        pwd = data.get("password")
        try:
            user = User.objects.get(user_name=user_name, password=pwd)

            return resultful.ok(
                message="登陆成功！",
                data=UserSerializers(user).data
            )
        except:
            return resultful.params_error(message="账号或密码错误，请重新输入！")
    else:
        return resultful.method_error("请求方法错误")


def register(request):
    if request.method == "POST":
        data = json.loads(request.body.decode())
        user_name = data.get("user_name")
        nick_name = data.get("nick_name")
        if nick_name is None:
            nick_name = user_name
        pwd = data.get("password")
        try:
            u = User.objects.create(
                user_name=user_name, nick_name=nick_name, password=pwd
            )

            return resultful.ok(
                message="注册成功！",
                data=UserSerializers(u).data
            )
        except IntegrityError:
            return resultful.params_error(message="用户名已存在")
        except:
            return resultful.server_error(message="服务器错误")
    else:
        return resultful.method_error("请求方法错误")


def update_user(request):
    if request.method == "POST":
        data = json.loads(request.body.decode())
        update_clo = []
        user_id = data.get("user_id")

        nick_name = data.get("nick_name")
        if nick_name is not None:
            update_clo.append("nick_name")

        sex = data.get("sex")
        if sex is not None:
            update_clo.append("sex")

        phone = data.get("phone")
        if phone is not None:
            update_clo.append("phone")

        age = data.get("age")
        if age is not None:
            update_clo.append("age")

        u = User(id=user_id, nick_name=nick_name, sex=int(sex), phone=phone, age=age)
        u.save(update_fields=update_clo)
        return resultful.ok(
            message="修改成功！",
        )
    else:
        return resultful.method_error("请求方法错误")


def update_pwd(request):
    if request.method == "POST":
        data = json.loads(request.body.decode())
        user_id = data.get("user_id")
        old_pwd = data.get("old_pwd")
        new_pwd = data.get("new_pwd")
        try:
            user = User.objects.get(id=user_id, password=old_pwd)
            user.password = new_pwd
            user.save()
            return resultful.ok(message="密码修改成功！")
        except:
            return resultful.params_error(message="旧密码错误，请重新输入！")
