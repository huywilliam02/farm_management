// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    DateTime? createdAt;
    DateTime? updatedAt;
    String? id;
    String? fullName;
    String? username;
    bool? isLocked;

    User({
        this.createdAt,
        this.updatedAt,
        this.id,
        this.fullName,
        this.username,
        this.isLocked,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        id: json["id"],
        fullName: json["fullName"],
        username: json["username"],
        isLocked: json["isLocked"],
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "id": id,
        "fullName": fullName,
        "username": username,
        "isLocked": isLocked,
    };
}
