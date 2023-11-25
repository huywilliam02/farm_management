import 'package:hive_flutter/hive_flutter.dart';
part 'login_model.g.dart';
@HiveType(typeId: 0)
class LoginModel extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String fullName;
  @HiveField(2)
  String username;
  @HiveField(3)
  bool isLocked;
  @HiveField(4)
  DateTime? createdAt;
  @HiveField(5)
  DateTime? updatedAt;
  LoginModel({
    this.id = "",
    this.fullName = "",
    this.username = "",
    this.isLocked = false,
    this.createdAt,
    this.updatedAt,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      id: json['id'],
      fullName: json['fullName'],
      username: json['username'],
      isLocked: json['isLocked'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'username': username,
      'isLocked': isLocked,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
