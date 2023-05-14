# Generated by Django 3.2.13 on 2023-04-24 20:15

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='categoriesModel',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('image', models.TextField()),
                ('color', models.CharField(max_length=8)),
            ],
        ),
        migrations.CreateModel(
            name='podcastModel',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('channel', models.CharField(max_length=50)),
                ('title', models.CharField(max_length=50)),
                ('description', models.TextField()),
                ('cover_pic', models.ImageField(upload_to='http://139.59.85.104/v1/storage/buckets/6446db7f0a8efb801dba/files/')),
                ('speaker', models.CharField(max_length=50)),
                ('type', models.CharField(choices=[('V', 'Video'), ('A', 'Audio')], max_length=1)),
                ('category', models.CharField(max_length=20)),
                ('data', models.FileField(upload_to='http://139.59.85.104/v1/storage/buckets/6446db7f0a8efb801dba/files/')),
            ],
        ),
    ]