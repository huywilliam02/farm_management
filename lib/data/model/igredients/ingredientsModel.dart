// To parse this JSON data, do
//
//     final ingredientsModel = ingredientsModelFromJson(jsonString);

import 'dart:convert';

IngredientsModel ingredientsModelFromJson(String str) => IngredientsModel.fromJson(json.decode(str));

String ingredientsModelToJson(IngredientsModel data) => json.encode(data.toJson());

class IngredientsModel {
  String name;
  int money;
  String quantity;
  String weight;
  String information;
  String time;
  bool status;
  List<String> images;


  IngredientsModel({
    required this.name,
    required this.money,
    required this.quantity,
    required this.weight,
    required this.information,
    required this.time,
    required this.status,
    required this.images,
  });

  factory IngredientsModel.fromJson(Map<String, dynamic> json) => IngredientsModel(
    name: json["name"],
    money: json["money"],
    quantity: json["quantity"],
    weight: json["weight"],
    information: json["information"],
    time: json["time"],
    status: json["status"],
    images: List<String>.from(json["images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "money": money,
    "quantity": quantity,
    "weight": weight,
    "information": information,
    "time": time,
    "status": status,
    "images": List<dynamic>.from(images.map((x) => x)),
  };
}
