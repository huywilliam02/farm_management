// To parse this JSON data, do
//
//     final customerModel = customerModelFromJson(jsonString);

import 'dart:convert';

CustomerModel customerModelFromJson(String str) =>
    CustomerModel.fromJson(json.decode(str));

String customerModelToJson(CustomerModel data) => json.encode(data.toJson());

class CustomerModel {
  String name;
  int quantity;
  String receptionDay;
  String description;
  bool status;

  CustomerModel({
    required this.name,
    required this.quantity,
    required this.receptionDay,
    required this.description,
    required this.status,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        name: json["name"],
        quantity: json["quantity"],
        receptionDay: json["receptionDay"],
        description: json["description"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "quantity": quantity,
        "receptionDay": receptionDay,
        "description": description,
        "status": status,
      };
}
