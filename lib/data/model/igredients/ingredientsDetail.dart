// To parse this JSON data, do
//
//     final ingredientsDetail = ingredientsDetailFromJson(jsonString);

import 'dart:convert';

IngredientsDetail ingredientsDetailFromJson(String str) =>
    IngredientsDetail.fromJson(json.decode(str));

String ingredientsDetailToJson(IngredientsDetail data) =>
    json.encode(data.toJson());

class IngredientsDetail {
  String? createdAt;
  String? updatedAt;
  String? id;
  String? name;
  int? money;
  String? quantity;
  String? weight;
  String? information;
  String? time;
  int? status;
  List<String>? images;

  IngredientsDetail({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.name,
    this.money,
    this.quantity,
    this.weight,
    this.information,
    this.time,
    this.status,
    this.images,
  });

  factory IngredientsDetail.fromJson(Map<String, dynamic> json) =>
      IngredientsDetail(
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        id: json["id"],
        name: json["name"],
        money: json["money"],
        quantity: json["quantity"],
        weight: json["weight"],
        information: json["information"],
        time: json["time"],
        status: json["status"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "id": id,
        "name": name,
        "money": money,
        "quantity": quantity,
        "weight": weight,
        "information": information,
        "time": time,
        "status": status,
        "images": List<dynamic>.from(images!.map((x) => x)),
      };
}
