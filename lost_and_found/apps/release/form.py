from django.forms import ModelForm
from .models import Release


class ReleaseForm(ModelForm):  # 继承ModelForm类
    class Meta:
        model = Release  # 具体要操作那个模型
        fields = ['name', 'desc', 'image', 'type', 'status',  'event_place']  # 允许编辑的字段
