from rest_framework import serializers
from apps.user.models import User


class UserSerializers(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ("id", "user_name", "nick_name", "sex", "phone", "age")
