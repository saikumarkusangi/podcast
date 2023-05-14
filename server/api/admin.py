from django.contrib import admin
from .models import categoriesModel,podcastModel
# Register your models here.
admin.site.register(categoriesModel)
admin.site.register(podcastModel)