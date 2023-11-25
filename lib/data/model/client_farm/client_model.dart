// To parse this JSON data, do
//
//     final supplier = supplierFromJson(jsonString);
import 'dart:convert';

ClientModel supplierFromJson(String str) => ClientModel.fromJson(json.decode(str));

String supplierToJson(ClientModel data) => json.encode(data.toJson());

class ClientModel {
  String name;
  String address;
  int debt;
  String phoneNumber;
  String description;

  ClientModel({
    required this.name,
    required this.address,
    required this.debt,
    required this.phoneNumber,
    required this.description,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
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
