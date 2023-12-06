// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) =>
    SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  String fullName;
  String enterprise;
  String email;
  String phone;
  String description;

  SignUpModel({
    required this.fullName,
    required this.enterprise,
    required this.email,
    required this.phone,
    required this.description,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        fullName: json["fullName"],
        enterprise: json["enterprise"],
        email: json["email"],
        phone: json["phone"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "enterprise": enterprise,
        "email": email,
        "phone": phone,
        "description": description,
      };
}
