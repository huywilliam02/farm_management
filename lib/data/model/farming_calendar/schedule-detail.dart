// To parse this JSON data, do
//
//     final detailSchedule = detailScheduleFromJson(jsonString);

import 'dart:convert';

import 'package:itfsd/data/model/area/moreLand.dart';


DetailSchedule detailScheduleFromJson(String str) =>
    DetailSchedule.fromJson(json.decode(str));

String detailScheduleToJson(DetailSchedule data) => json.encode(data.toJson());

class DetailSchedule {
  String? createdAt;
  String? updatedAt;
  String? id;
  String? productName;
  int? numberOfVarites;
  DateTime? startDay;
  DateTime? endDate;
  String? seedProvider;
  int? expectOutput;
  String? unit;
  List<UserData>? users;
  Land? land;
  ProductType? productType;

  DetailSchedule({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.productName,
    this.numberOfVarites,
    this.startDay,
    this.endDate,
    this.seedProvider,
    this.expectOutput,
    this.unit,
    this.users,
    this.land,
    this.productType,
  });

  factory DetailSchedule.fromJson(Map<String, dynamic> json) => DetailSchedule(
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        id: json["id"],
        productName: json["product_name"],
        numberOfVarites: json["numberOfVarites"],
        startDay: DateTime.parse(json["startDay"]),
        endDate: DateTime.parse(json["endDate"]),
        seedProvider: json["seedProvider"],
        expectOutput: json["expectOutput"],
        unit: json["unit"],
        users: json["users"] == null
            ? []
            : List<UserData>.from(
                json["users"]!.map((x) => UserData.fromJson(x))),
        land: json["land"] == null ? null : Land.fromJson(json["land"]),
        productType: json["productType"] == null
            ? null
            : ProductType.fromJson(json["productType"]),
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "id": id,
        "product_name": productName,
        "numberOfVarites": numberOfVarites,
        "startDay":
            "${startDay!.year.toString().padLeft(4, '0')}-${startDay!.month.toString().padLeft(2, '0')}-${startDay!.day.toString().padLeft(2, '0')}",
        "endDate":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "seedProvider": seedProvider,
        "expectOutput": expectOutput,
        "unit": unit,
        "users": users == null
            ? []
            : List<dynamic>.from(users!.map((x) => x.toJson())),
        "land": land?.toJson(),
        "productType": productType?.toJson(),
      };
}

class Land {
  String? createdAt;
  String? updatedAt;
  String? id;
  String? name;
  int? acreage;
  List<String>? images;
  List<Location>? locations;

  Land({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.name,
    this.acreage,
    this.images,
    this.locations,
  });

  factory Land.fromJson(Map<String, dynamic> json) => Land(
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        id: json["id"],
        name: json["name"],
        acreage: json["acreage"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        locations: json["locations"] == null
            ? []
            : List<Location>.from(
                json["locations"]!.map((x) => Location.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "id": id,
        "name": name,
        "acreage": acreage,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "locations": locations == null
            ? []
            : List<dynamic>.from(locations!.map((x) => x.toJson())),
      };
}

class ProductType {
  String? createdAt;
  String? updatedAt;
  String? id;
  dynamic key;
  String? name;
  dynamic description;
  ChildColumn? childColumn;
  dynamic idParent;
  bool? active;

  ProductType({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.key,
    this.name,
    this.description,
    this.childColumn,
    this.idParent,
    this.active,
  });

  factory ProductType.fromJson(Map<String, dynamic> json) => ProductType(
        createdAt: json["createdAt"] ?? "",
        updatedAt: json["updatedAt"] ?? "",
        id: json["id"] ?? "",
        key: json["key"] ?? "",
        name: json["name"],
        description: json["description"] ?? "",
        childColumn: json["child_column"] == null
            ? null
            : ChildColumn.fromJson(json["child_column"]),
        idParent: json["id_parent"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "id": id,
        "key": key,
        "name": name,
        "description": description,
        "child_column": childColumn?.toJson(),
        "id_parent": idParent,
        "active": active,
      };
}

class ChildColumn {
  String? color;

  ChildColumn({
    this.color,
  });

  factory ChildColumn.fromJson(Map<String, dynamic> json) => ChildColumn(
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "color": color,
      };
}

class UserData {
  DateTime? createdAt;
  DateTime? updatedAt;
  String? id;
  String? fullName;
  String? username;
  bool? isLocked;

  UserData({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.fullName,
    this.username,
    this.isLocked,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
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
