// To parse this JSON data, do
//
//     final supplier = supplierFromJson(jsonString);
import 'dart:convert';

OtherObjectModel supplierFromJson(String str) => OtherObjectModel.fromJson(json.decode(str));

String supplierToJson(OtherObjectModel data) => json.encode(data.toJson());

class OtherObjectModel {
  String name;
  String address;
  int debt;
  String phoneNumber;
  String description;

  OtherObjectModel({
    required this.name,
    required this.address,
    required this.debt,
    required this.phoneNumber,
    required this.description,
  });

  factory OtherObjectModel.fromJson(Map<String, dynamic> json) => OtherObjectModel(
        name: json["name"],
        address: json["address"],
        debt: json["debt"],
        phoneNumber: json["phoneNumber"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "debt": debt,
        "phoneNumber": phoneNumber,
        "description": description,
      };
}
