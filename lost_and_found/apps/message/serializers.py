from rest_framework import serializers
from apps.message.models import Message
from apps.user.serializers import UserSerializers


class MessageSerializers(serializers.ModelSerializer):
    user = UserSerializers()
    to_user = UserSerializers()
    created_at = serializers.DateTimeField('%Y-%m-%d %H:%M:%S')

    class Meta:
        model = Message
        fields = ("id", "release", "user", "to_user", "pid", "content", "created_at")

#  序列化问题参考：https://www.cnblogs.com/xiugeng/p/11460855.html
