// To parse this JSON data, do
//
//     final userDetailsmodel = userDetailsmodelFromJson(jsonString);

import 'dart:convert';

UserDetailsModel userDetailsmodelFromJson(String str) =>
    UserDetailsModel.fromJson(json.decode(str));

String userDetailsmodelToJson(UserDetailsModel data) =>
    json.encode(data.toJson());

class UserDetailsModel {
  DateTime createdAt;
  DateTime updatedAt;
  String id;
  String fullName;
  String jobTitle;
  String? description;
  String? avatar;
  String username;
  String role;
  bool isLocked;

  UserDetailsModel({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.fullName,
    required this.jobTitle,
    required this.description,
    required this.avatar,
    required this.username,
    required this.role,
    required this.isLocked,
  });

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) =>
      UserDetailsModel(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
        fullName: json["fullName"],
        jobTitle: json["jobTitle"] ?? "",
        description: json["description"],
        avatar: json["avatar"],
        username: json["username"],
        role: json["role"],
        isLocked: json["isLocked"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "id": id,
        "fullName": fullName,
        "jobTitle": jobTitle,
        "description": description,
        "avatar": avatar,
        "username": username,
        "role": role,
        "isLocked": isLocked,
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
