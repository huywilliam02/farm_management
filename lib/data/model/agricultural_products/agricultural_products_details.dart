// To parse this JSON data, do
//
//     final agriculturalProductDetails = agriculturalProductDetailsFromJson(jsonString);

import 'dart:convert';

AgriculturalProductDetails agriculturalProductDetailsFromJson(String str) => AgriculturalProductDetails.fromJson(json.decode(str));

String agriculturalProductDetailsToJson(AgriculturalProductDetails data) => json.encode(data.toJson());

class AgriculturalProductDetails {
  String createdAt;
  String updatedAt;
  String id;
  String name;
  int money;
  String quantity;
  String weight;
  String time;
  List<String> images;
  Farm farm;
  // bool status;

  AgriculturalProductDetails({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.name,
    required this.money,
    required this.quantity,
    required this.weight,
    required this.time,
    required this.images,
    // required this.status,
    required this.farm,
  });

  factory AgriculturalProductDetails.fromJson(Map<String, dynamic> json) => AgriculturalProductDetails(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    name: json["name"],
    money: json["money"],
    quantity: json["quantity"],
    weight: json["weight"],
    time: json["time"],
    images: List<String>.from(json["images"].map((x) => x)),
    // status: json["status"],
    farm: Farm.fromJson(json["farm"]),
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "id": id,
    "name": name,
    "money": money,
    "quantity": quantity,
    "weight": weight,
    "time": time,
    // "status": status,
    "images": List<dynamic>.from(images.map((x) => x)),
    "farm": farm.toJson(),
  };
}

class Farm {
  String id;
  String name;

  Farm({
    required this.id,
    required this.name,
  });

  factory Farm.fromJson(Map<String, dynamic> json) => Farm(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
