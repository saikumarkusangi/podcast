// To parse this JSON data, do
//
//     final podcastModel = podcastModelFromJson(jsonString);

import 'dart:convert';

List<PodcastModel> podcastModelFromJson(String str) => List<PodcastModel>.from(json.decode(str).map((x) => PodcastModel.fromJson(x)));

String podcastModelToJson(List<PodcastModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PodcastModel {
    PodcastModel({
        required this.title,
        required this.category,
        required this.media,
        required this.type,
        required this.speaker,
        required this.description,
        required this.coverPic,
        required this.channel,
    });

    String title;
    String category;
    String media;
    String type;
    String speaker;
    String description;
    String coverPic;
    String channel;

    factory PodcastModel.fromJson(Map<String, dynamic> json) => PodcastModel(
        title: json["title"],
        category: json["category"],
        media: json["media"],
        type: json["type"],
        speaker: json["speaker"],
        description: json["description"],
        coverPic: json["cover_pic"],
        channel: json["channel"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "category": category,
        "media": media,
        "type": type,
        "speaker": speaker,
        "description": description,
        "cover_pic": coverPic,
        "channel": channel,
    };
}
