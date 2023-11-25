// To parse this JSON data, do
//
//     final materialModel = materialModelFromJson(jsonString);

import 'dart:convert';

MaterialModel materialModelFromJson(String str) =>
    MaterialModel.fromJson(json.decode(str));

String materialModelToJson(MaterialModel data) => json.encode(data.toJson());

class MaterialModel {
  String name;
  int quantity;
  String description;
  int price;
  List<String>? images;
  String? materialGroup;
  bool status;

  MaterialModel({
    required this.name,
    required this.quantity,
    required this.description,
    required this.price,
    this.images,  
    this.materialGroup,
      required this.status});

  factory MaterialModel.fromJson(Map<String, dynamic> json) => MaterialModel(
        name: json["name"],
        quantity: json["quantity"],
        description: json["description"],
        price: json["price"],
        images: List<String>.from(json["images"].map((x) => x)),
        materialGroup: json["materialGroup"],
        status:json["status"]
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "quantity": quantity,
        "description": description,
        // "images": List<dynamic>.from(images.map((x) => x)),
        "materialGroup": materialGroup,
        "status":status
      };
}

class MaterialGroup {
  DateTime createdAt;
  DateTime updatedAt;
  String id;
  dynamic key;
  String name;
  dynamic description;
  dynamic childColumn;
  dynamic idParent;
  bool active;

  MaterialGroup({
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

  factory MaterialGroup.fromJson(Map<String, dynamic> json) => MaterialGroup(
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
