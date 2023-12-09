// To parse this JSON data, do
//
//     final editProfile = editProfileFromJson(jsonString);

import 'dart:convert';

EditProfile editProfileFromJson(String str) =>
    EditProfile.fromJson(json.decode(str));

String editProfileToJson(EditProfile data) => json.encode(data.toJson());

class EditProfile {
  DateTime? createdAt;
  DateTime? updatedAt;
  String? id;
  String fullName;
  String? username;
  String? password;
  bool? isLocked;
  String? role;
  String jobTitle;
  String description;
  String? avatar;
  String homeTown;
  String address;
  String? email;
  String phoneNumber;

  EditProfile({
    this.createdAt,
    this.updatedAt,
    this.id,
    required this.fullName,
    this.username,
    this.password,
    this.isLocked,
    this.role,
    required this.jobTitle,
    required this.description,
    this.avatar,
    required this.homeTown,
    required this.address,
    this.email,
    required this.phoneNumber,
  });

  factory EditProfile.fromJson(Map<String, dynamic> json) => EditProfile(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
        fullName: json["fullName"],
        username: json["username"],
        password: json["password"],
        isLocked: json["isLocked"],
        role: json["role"],
        jobTitle: json["jobTitle"],
        description: json["description"],
        avatar: json["avatar"],
        homeTown: json["homeTown"],
        address: json["address"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "id": id,
        "fullName": fullName,
        "username": username,
        "password": password,
        "isLocked": isLocked,
        "role": role,
        "jobTitle": jobTitle,
        "description": description,
        "avatar": avatar,
        "homeTown": homeTown,
        "address": address,
        "email": email,
        "phoneNumber": phoneNumber,
      };
}
