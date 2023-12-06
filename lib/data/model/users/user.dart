import 'dart:convert';

UserModel usermodelFromJson(String str) => UserModel.fromJson(json.decode(str));

String usermodelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String fullName;
  String username;
  String password;
  String phoneNumber;
  String jobTitle;
  String description;
  String email;
  String avatar;
  String homeTown;
  String address;
  String role;
  bool isLocked;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? id;

  UserModel({
    required this.fullName,
    this.jobTitle = "",
    this.description = "",
    this.avatar = "",
    required this.password,
    required this.username,
    required this.email,
    this.address = "",
    this.homeTown = "",
    required this.role,
    this.phoneNumber = "",
    required this.isLocked,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json["fullName"],
      jobTitle: json["jobTitle"] ?? "",
      description: json["description"] ?? "",
      avatar: json["avatar"] ?? "",
      username: json["username"],
      password: json["password"],
      phoneNumber: json["phoneNumber"] ?? "",
      email: json["email"],
      address: json["address"] ?? "",
      homeTown: json["homeTown"] ?? "",
      role: json["role"],
      isLocked: json["isLocked"] ?? false,
      createdAt:
          json["createdAt"] != null ? DateTime.parse(json["createdAt"]) : null,
      updatedAt:
          json["updatedAt"] != null ? DateTime.parse(json["updatedAt"]) : null,
      id: json["id"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "fullName": fullName,
      "jobTitle": jobTitle,
      "description": description,
      "avatar": avatar,
      "username": username,
      "password": password,
      "email": email,
      "role": role,
      "address": address,
      "homeTown": homeTown,
      "phoneNumber": phoneNumber,
      "isLocked": isLocked,
      "createdAt": createdAt?.toIso8601String(),
      "updatedAt": updatedAt?.toIso8601String(),
      "id": id,
    }..removeWhere((key, value) => value == null);
  }
}
