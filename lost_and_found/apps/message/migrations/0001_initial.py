# Generated by Django 4.1.5 on 2023-01-28 18:22

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('release', '__first__'),
        ('user', '__first__'),
    ]

    operations = [
        migrations.CreateModel(
            name='Message',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('pid', models.BigIntegerField(blank=True, null=True)),
                ('content', models.TextField(blank=True, null=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('release', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='release.release')),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='user.user')),
            ],
            options={
                'verbose_name_plural': '消息表',
                'db_table': 'message',
            },
        ),
    ]
