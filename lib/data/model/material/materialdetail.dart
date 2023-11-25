// To parse this JSON data, do
//
//     final materialDetail = materialDetailFromJson(jsonString);

import 'dart:convert';

MaterialDetail materialDetailFromJson(String str) =>
    MaterialDetail.fromJson(json.decode(str));

String materialDetailToJson(MaterialDetail data) => json.encode(data.toJson());

class MaterialDetail {
  String createdAt;
  String updatedAt;
  String id;
  String name;
  int quantity;
  String description;
  int price;
  int status;
  List<String> images;
  MaterialGroup materialGroup;

  MaterialDetail({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.name,
    required this.quantity,
    required this.description,
    required this.price,
    required this.status,
    required this.images,
    required this.materialGroup,
  });

  factory MaterialDetail.fromJson(Map<String, dynamic> json) => MaterialDetail(
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        id: json["id"],
        name: json["name"],
        quantity: json["quantity"]??0,
        description: json["description"],
        price: json["price"]??0,
        status: json["status"]??0,
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        materialGroup: MaterialGroup.fromJson(json["materialGroup"]),
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "id": id,
        "name": name,
        "quantity": quantity,
        "description": description,
        "price": price,
        "status": status,
        "images": List<dynamic>.from(images.map((x) => x)),
        "materialGroup": materialGroup.toJson(),
      };
}

class MaterialGroup {
  String createdAt;
  String updatedAt;
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
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        id: json["id"],
        key: json["key"],
        name: json["name"],
        description: json["description"],
        childColumn: json["child_column"],
        idParent: json["id_parent"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "id": id,
        "key": key,
        "name": name,
        "description": description,
        "child_column": childColumn,
        "id_parent": idParent,
        "active": active,
      };
}
