# -- 用户表：user
# -- 字段：id、用户名、昵称、密码、性别、手机号

from django.db import models


class User(models.Model):
    user_sex = (
        ("0", "女"),
        ("1", "男")
    )
    user_name = models.CharField(max_length=20, unique=True)
    nick_name = models.CharField(max_length=20)
    password = models.CharField(max_length=20)
    age = models.CharField(max_length=2, blank=True, default="")
    sex = models.CharField(blank=True, choices=user_sex, max_length=1)
    phone = models.CharField(max_length=11, blank=True, default="")
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'user'
        verbose_name_plural = '用户表'
