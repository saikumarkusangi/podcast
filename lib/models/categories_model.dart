// To parse this JSON data, do
//
//     final catergoriesModel = catergoriesModelFromJson(jsonString);

import 'dart:convert';

List<CatergoriesModel> catergoriesModelFromJson(String str) => List<CatergoriesModel>.from(json.decode(str).map((x) => CatergoriesModel.fromJson(x)));

String catergoriesModelToJson(List<CatergoriesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CatergoriesModel {
    CatergoriesModel({
        required this.id,
        required this.name,
        required this.image,
        required this.color,
    });

    int id;
    String name;
    String image;
    String color;

    factory CatergoriesModel.fromJson(Map<String, dynamic> json) => CatergoriesModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        color: json["color"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "color": color,
    };
}
