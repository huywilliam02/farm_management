// To parse this JSON data, do
//
//     final detailSchedule = detailScheduleFromJson(jsonString);

import 'dart:convert';

DetailSchedule detailScheduleFromJson(String str) => DetailSchedule.fromJson(json.decode(str));

String detailScheduleToJson(DetailSchedule data) => json.encode(data.toJson());

class DetailSchedule {
  DateTime? createdAt;
  DateTime? updatedAt;
  String? id;
  String? productName;
  int? numberOfVarites;
  DateTime? startDay;
  DateTime? endDate;
  String? seedProvider;
  int? expectOutput;
  String? unit;
  List<User>? users;
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
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    id: json["id"],
    productName: json["product_name"],
    numberOfVarites: json["numberOfVarites"],
    startDay: json["startDay"] == null ? null : DateTime.parse(json["startDay"]),
    endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
    seedProvider: json["seedProvider"],
    expectOutput: json["expectOutput"],
    unit: json["unit"],
    users: json["users"] == null ? [] : List<User>.from(json["users"]!.map((x) => User.fromJson(x))),
    land: json["land"] == null ? null : Land.fromJson(json["land"]),
    productType: json["productType"] == null ? null : ProductType.fromJson(json["productType"]),
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "id": id,
    "product_name": productName,
    "numberOfVarites": numberOfVarites,
    "startDay": startDay?.toIso8601String(),
    "endDate": endDate?.toIso8601String(),
    "seedProvider": seedProvider,
    "expectOutput": expectOutput,
    "unit": unit,
    "users": users == null ? [] : List<dynamic>.from(users!.map((x) => x.toJson())),
    "land": land?.toJson(),
    "productType": productType?.toJson(),
  };
}

class Land {
  DateTime? createdAt;
  DateTime? updatedAt;
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
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    id: json["id"],
    name: json["name"],
    acreage: json["acreage"],
    images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
    locations: json["locations"] == null ? [] : List<Location>.from(json["locations"]!.map((x) => Location.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "id": id,
    "name": name,
    "acreage": acreage,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "locations": locations == null ? [] : List<dynamic>.from(locations!.map((x) => x.toJson())),
  };
}

class Location {
  int? point;
  double? latitude;
  double? longitude;

  Location({
    this.point,
    this.latitude,
    this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    point: json["point"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "point": point,
    "latitude": latitude,
    "longitude": longitude,
  };
}

class ProductType {
  DateTime? createdAt;
  DateTime? updatedAt;
  String? id;
  dynamic key;
  String? name;
  String? description;
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
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    id: json["id"],
    key: json["key"],
    name: json["name"],
    description: json["description"],
    childColumn: json["child_column"] == null ? null : ChildColumn.fromJson(json["child_column"]),
    idParent: json["id_parent"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
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

class User {
  DateTime? createdAt;
  DateTime? updatedAt;
  String? id;
  String? fullName;
  String? jobTitle;
  String? description;
  String? avatar;
  String? username;
  String? email;
  String? phoneNumber;
  String? role;
  bool? isLocked;
  String? homeTown;
  String? address;

  User({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.fullName,
    this.jobTitle,
    this.description,
    this.avatar,
    this.username,
    this.email,
    this.phoneNumber,
    this.role,
    this.isLocked,
    this.homeTown,
    this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    id: json["id"],
    fullName: json["fullName"],
    jobTitle: json["jobTitle"],
    description: json["description"],
    avatar: json["avatar"],
    username: json["username"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    role: json["role"],
    isLocked: json["isLocked"],
    homeTown: json["homeTown"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
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
