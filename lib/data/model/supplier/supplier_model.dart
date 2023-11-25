// To parse this JSON data, do
//
//     final supplier = supplierFromJson(jsonString);
import 'dart:convert';

Supplier supplierFromJson(String str) => Supplier.fromJson(json.decode(str));

String supplierToJson(Supplier data) => json.encode(data.toJson());

class Supplier {
  String name;
  String address;
  int debt;
  String phoneNumber;
  String description;

  Supplier({
    required this.name,
    required this.address,
    required this.debt,
    required this.phoneNumber,
    required this.description,
  });

  factory Supplier.fromJson(Map<String, dynamic> json) => Supplier(
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
