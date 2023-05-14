from django.shortcuts import render
from django.http import JsonResponse, response
from rest_framework.views import APIView
from .models import categoriesModel, podcastModel
from rest_framework.filters import SearchFilter
from .serializers import *
from rest_framework import status, filters, generics


class categories(generics.ListAPIView):
    queryset = categoriesModel.objects.all()
    serializer_class = CategorySerialzer
    filter_backends = [filters.SearchFilter]
    search_fields = ['name']

    def post(self, request):
        new_category = categoriesModel.objects.create(
            name=request.data["name"],
            image=request.data["image"],
            color=request.data["color"])
        return JsonResponse({"data": request.data})


# class JobView(generics.ListAPIView):
#     queryset = podcastModel.objects.all()
#     serializer_class = PodcastsSerialzer
#     filter_backends = [filters.SearchFilter]
#     search_fields = ['category']


class podcasts(generics.ListAPIView):
    queryset = podcastModel.objects.all()
    serializer_class = PodcastsSerialzer
    filter_backends = [filters.SearchFilter]
    search_fields = ['category', 'channel', 'speaker', 'title']

    def post(self, request):
        new_podcast = podcastModel.objects.create(
            
            channel=request.data["channel"],
            title=request.data["title"],
            description=request.data["description"],
            speaker=request.data["speaker"],
            type=request.data["type"],
            cover_pic=request.data["cover_pic"],
            media=request.data["media"],
            category=request.data["category"])
        return JsonResponse({"data": request.data})
