# Generated by Django 3.2.13 on 2023-04-24 21:13

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0002_alter_categoriesmodel_image'),
    ]

    operations = [
        migrations.RenameField(
            model_name='podcastmodel',
            old_name='data',
            new_name='media',
        ),
    ]
