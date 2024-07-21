# -- 留言信息表：message
# -- 字段：id、发布id、用户id、pid、留言内容、创建时间

from django.db import models
from apps.release.models import Release
from apps.user.models import User


class Message(models.Model):
    release = models.ForeignKey(Release, on_delete=models.SET_NULL, blank=True, null=True)
    user = models.ForeignKey(User, on_delete=models.SET_NULL, blank=True, null=True, related_name="User")
    to_user = models.ForeignKey(User, on_delete=models.SET_NULL, blank=True, null=True, related_name="ToUser")
    pid = models.BigIntegerField(blank=True, null=True)
    content = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'message'
        verbose_name_plural = '消息表'
