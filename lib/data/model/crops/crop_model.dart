// To parse this JSON data, do
//
//     final cropsFarmModel = cropsFarmModelFromJson(jsonString);

import 'dart:convert';

CropsFarmModel cropsFarmModelFromJson(String str) =>
    CropsFarmModel.fromJson(json.decode(str));

String cropsFarmModelToJson(CropsFarmModel data) => json.encode(data.toJson());

class CropsFarmModel {
  String name;
  String disease;
  String growth;
  String use;
  String harvest;
  int price;
  List<String>? images;
  String groupCrop;

  String? id;

  CropsFarmModel({
    required this.name,
    required this.disease,
    required this.growth,
    required this.use,
    required this.harvest,
    required this.price,
    this.images,
    required this.groupCrop,
    this.id,
  });

  factory CropsFarmModel.fromJson(Map<String, dynamic> json) => CropsFarmModel(
        name: json["name"],
        disease: json["disease"],
        growth: json["growth"],
        use: json["use"],
        harvest: json["harvest"],
        price: json["price"],
        images: List<String>.from(json["images"].map((x) => x)),
        groupCrop: json["groupCrop"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "disease": disease,
        "growth": growth,
        "use": use,
        "harvest": harvest,
        "price": price,
        "images": List<dynamic>.from(images!.map((x) => x)),
        "groupCrop": groupCrop,
        "id": id,
      };
}

class GroupCrop {
  DateTime createdAt;
  DateTime updatedAt;
  String id;
  dynamic key;
  String name;
  dynamic description;
  dynamic childColumn;
  dynamic idParent;
  bool active;

  GroupCrop({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.key,
    required this.name,
    required this.description,
    required this.childColumn,
    required this.idParent,
    required this.active,
  });

  factory GroupCrop.fromJson(Map<String, dynamic> json) => GroupCrop(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
        key: json["key"],
        name: json["name"],
        description: json["description"],
        childColumn: json["child_column"],
        idParent: json["id_parent"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "id": id,
        "key": key,
        "name": name,
        "description": description,
        "child_column": childColumn,
        "id_parent": idParent,
        "active": active,
      };
}
