// To parse this JSON data, do
//
//     final accountModel = accountModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
part 'login_model.g.dart';

LoginModel accountModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String accountModelToJson(LoginModel data) => json.encode(data.toJson());

@HiveType(typeId: 0)
class LoginModel extends HiveObject {
  @HiveField(0)
  String createdAt;
  @HiveField(1)
  String updatedAt;
  @HiveField(2)
  String id;
  @HiveField(3)
  String fullName;
  @HiveField(4)
  String jobTitle;
  @HiveField(5)
  String description;
  @HiveField(6)
  String avatar;
  @HiveField(7)
  String username;
  @HiveField(8)
  String email;
  @HiveField(9)
  String phoneNumber;
  @HiveField(10)
  String role;
  @HiveField(11)
  bool isLocked;
  @HiveField(12)
  String homeTown;
  @HiveField(13)
  String address;

  LoginModel({
    this.createdAt = "",
    this.updatedAt = "",
    this.id = "",
    this.fullName = "",
    this.jobTitle = "",
    this.description = "",
    this.avatar = "",
    this.username = "",
    this.email = "",
    this.phoneNumber = "",
    this.role = "",
    this.isLocked = false,
    this.homeTown = "",
    this.address = "",
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        createdAt: json["createdAt"] ?? "",
        updatedAt: json["updatedAt"] ?? "",
        id: json["id"] ?? "",
        fullName: json["fullName"] ?? "",
        jobTitle: json["jobTitle"] ?? "",
        description: json["description"] ?? "",
        avatar: json["avatar"] ?? "",
        username: json["username"] ?? "",
        email: json["email"] ?? "",
        phoneNumber: json["phoneNumber"] ?? "",
        role: json["role"] ?? "",
        isLocked: json["isLocked"] ?? "",
        homeTown: json["homeTown"] ?? "",
        address: json["address"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "id": id,
        "fullName": fullName,
        "jobTitle": jobTitle,
        "description": description,
        "avatar": avatar,
        "username": username,
        "email": email,
        "phoneNumber": phoneNumber,
        "role": role,
        "isLocked": isLocked,
        "homeTown": homeTown,
        "address": address,
      };
}
