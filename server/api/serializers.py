from rest_framework import serializers
from .models import *


class PodcastsSerialzer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = podcastModel
        fields = ('title', 'category', 'media', 'type', 'speaker',
                  'description', 'cover_pic', 'channel')


class CategorySerialzer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = categoriesModel
        fields = ('name', 'image', 'color')
