// To parse this JSON data, do
//
//     final requestForm = requestFormFromJson(jsonString);

import 'dart:convert';

RequestForm requestFormFromJson(String str) =>
    RequestForm.fromJson(json.decode(str));

String requestFormToJson(RequestForm data) => json.encode(data.toJson());

class RequestForm {
  String name;
  int quantity;
  String description;
  String material;
  String provider;
  int status;

  RequestForm({
    required this.name,
    required this.quantity,
    required this.description,
    required this.material,
    required this.provider,
    required this.status,
  });

  factory RequestForm.fromJson(Map<String, dynamic> json) => RequestForm(
        name: json["name"],
        quantity: json["quantity"],
        description: json["description"],
        material: json["material"],
        provider: json["provider"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "quantity": quantity,
        "description": description,
        "material": material,
        "provider": provider,
        "status": status,
      };
}
