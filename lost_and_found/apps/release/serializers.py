from rest_framework import serializers
from apps.release.models import Release
from apps.user.serializers import UserSerializers


class ReleaseSerializers(serializers.ModelSerializer):
    user = UserSerializers()
    event_at = serializers.DateTimeField('%Y-%m-%d %H:%M:%S')
    created_at = serializers.DateTimeField('%Y-%m-%d %H:%M:%S')
    updated_at = serializers.DateTimeField('%Y-%m-%d %H:%M:%S')
    status = serializers.SerializerMethodField()
    type = serializers.SerializerMethodField()

    class Meta:
        model = Release
        fields = (
            "id", "name", "desc", "type", "image", "status", "event_at", "event_place", "created_at", "updated_at",
            "user")

    def get_status(self, obj):
        return obj.get_status_display()

    def get_type(self, obj):
        return obj.get_type_display()
