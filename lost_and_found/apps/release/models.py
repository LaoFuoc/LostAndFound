from django.db import models
from apps.user.models import User


# -- 发布信息表：release
# -- 字段：id、用户id、物品id、类型（失物招领/寻物启事）、状态、丢失时间、丢失地点、创建时间、更新时间
class Release(models.Model):
    # 每个二元组的第一个值会储存在数据库中，而第二个值将只会用于在表单中显示。
    # 对于一个模型实例，要获取该字段二元组中相对应的第二个值，使用 get_FOO_display() 方法。例如：
    release_type = (
        ("0", "默认"),
        ("1", "失物招领"),
        ("2", "寻物启事")
    )
    release_status = (
        ("0", "未完成"),
        ("1", "已完成"),
    )

    user = models.ForeignKey(User, on_delete=models.SET_NULL, blank=True, null=True)
    name = models.CharField("物品名称", max_length=30)
    desc = models.CharField("物品描述", max_length=255)
    image = models.ImageField("物品图片", upload_to="static/")
    type = models.CharField(blank=True, choices=release_type, max_length=1)
    status = models.CharField(blank=True, choices=release_status, max_length=1)
    event_at = models.DateTimeField(auto_now=True)
    event_place = models.CharField(max_length=255)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'release'
        verbose_name_plural = '发布信息表'
