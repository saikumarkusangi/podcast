// To parse this JSON data, do
//
//     final podcastModel = podcastModelFromJson(jsonString);

import 'dart:convert';

List<PodcastModel> podcastModelFromJson(String str) => List<PodcastModel>.from(json.decode(str).map((x) => PodcastModel.fromJson(x)));

String podcastModelToJson(List<PodcastModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PodcastModel {
    PodcastModel({
        required this.name,
        required this.category,
        required this.data,
        required this.type,
        required this.speaker,
        required this.description,
        required this.coverPic,
    });

    String name;
    String category;
    String data;
    String type;
    String speaker;
    String description;
    String coverPic;

    factory PodcastModel.fromJson(Map<String, dynamic> json) => PodcastModel(
        name: json["name"],
        category: json["category"],
        data: json["data"],
        type: json["type"],
        speaker: json["speaker"],
        description: json["description"],
        coverPic: json["cover_pic"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "category": category,
        "data": data,
        "type": type,
        "speaker": speaker,
        "description": description,
        "cover_pic": coverPic,
    };
}
