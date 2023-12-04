// To parse this JSON data, do
//
//     final userDetailsModel = userDetailsModelFromJson(jsonString);

import 'dart:convert';

UserDetailsModel userDetailsModelFromJson(String str) =>
    UserDetailsModel.fromJson(json.decode(str));

String userDetailsModelToJson(UserDetailsModel data) =>
    json.encode(data.toJson());

class UserDetailsModel {
  DateTime createdAt;
  DateTime updatedAt;
  String id;
  String fullName;
  String jobTitle;
  String description;
  String avatar;
  String username;
  String email;
  String phoneNumber;
  String role;
  bool isLocked;
  String homeTown;
  String address;

  UserDetailsModel({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.fullName,
    required this.jobTitle,
    required this.description,
    required this.avatar,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.role,
    required this.isLocked,
    required this.homeTown,
    required this.address,
  });

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) =>
      UserDetailsModel(
        createdAt: DateTime.parse(json["createdAt"] ?? "").toLocal(),
        updatedAt: DateTime.parse(json["updatedAt"] ?? "").toLocal(),
        id: json["id"] ?? "",
        fullName: json["fullName"] ?? "",
        jobTitle: json["jobTitle"] ?? "",
        description: json["description"] ?? "",
        avatar: json["avatar"] ?? "",
        username: json["username"] ?? "",
        email: json["email"] ?? "",
        phoneNumber: json["phoneNumber"] ?? "",
        role: json["role"] ?? "",
        isLocked: json["isLocked"] ?? false, // Assuming it's a boolean field
        homeTown: json["homeTown"] ?? "",
        address: json["address"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toLocal().toString(),
        "updatedAt": updatedAt.toLocal().toString(),
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

class Meta {
  int page;
  int take;
  int itemCount;
  int pageCount;
  bool hasPreviousPage;
  bool hasNextPage;

  Meta({
    required this.page,
    required this.take,
    required this.itemCount,
    required this.pageCount,
    required this.hasPreviousPage,
    required this.hasNextPage,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        page: json["page"],
        take: json["take"],
        itemCount: json["itemCount"],
        pageCount: json["pageCount"],
        hasPreviousPage: json["hasPreviousPage"],
        hasNextPage: json["hasNextPage"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "take": take,
        "itemCount": itemCount,
        "pageCount": pageCount,
        "hasPreviousPage": hasPreviousPage,
        "hasNextPage": hasNextPage,
      };
}
