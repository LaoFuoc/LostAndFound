# Generated by Django 4.1.5 on 2023-02-12 16:52

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0003_alter_user_nick_name_alter_user_user_name'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='age',
            field=models.CharField(blank=True, max_length=2, null=True),
        ),
    ]
