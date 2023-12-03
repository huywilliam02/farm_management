// // To parse this JSON data, do
// //
// //     final user = userFromJson(jsonString);
//
// import 'dart:convert';
//
// User userFromJson(String str) => User.fromJson(json.decode(str));
//
// String userToJson(User data) => json.encode(data.toJson());
//
// class User {
//     DateTime? createdAt;
//     DateTime? updatedAt;
//     String? id;
//     String? fullName;
//     String? username;
//     bool? isLocked;
//
//     User({
//         this.createdAt,
//         this.updatedAt,
//         this.id,
//         this.fullName,
//         this.username,
//         this.isLocked,
//     });
//
//     factory User.fromJson(Map<String, dynamic> json) => User(
//         createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//         id: json["id"],
//         fullName: json["fullName"],
//         username: json["username"],
//         isLocked: json["isLocked"],
//     );
//
//     Map<String, dynamic> toJson() => {
//         "createdAt": createdAt?.toIso8601String(),
//         "updatedAt": updatedAt?.toIso8601String(),
//         "id": id,
//         "fullName": fullName,
//         "username": username,
//         "isLocked": isLocked,
//     };
// }
// To parse this JSON data, do
//
//     final usermodel = usermodelFromJson(jsonString);

import 'dart:convert';

UserModel usermodelFromJson(String str) => UserModel.fromJson(json.decode(str));

String usermodelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    String fullName;
    String jobTitle;
    String description;
    String avatar;
    String username;
    String role;
    bool isLocked;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? id;

    UserModel({
        required this.fullName,
        required this.jobTitle,
        required this.description,
        required this.avatar,
        required this.username,
        required this.role,
        required this.isLocked,
         this.createdAt,
         this.updatedAt,
         this.id,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        fullName: json["fullName"],
        jobTitle: json["jobTitle"],
        description: json["description"],
        avatar: json["avatar"],
        username: json["username"],
        role: json["role"],
        isLocked: json["isLocked"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "jobTitle": jobTitle,
        "description": description,
        "avatar": avatar,
        "username": username,
        "role": role,
        "isLocked": isLocked,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "id": id,
    };
}
