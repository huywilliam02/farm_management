// To parse this JSON data, do
//
//     final farmDetail = farmDetailFromJson(jsonString);

import 'dart:convert';

FarmDetail farmDetailFromJson(String str) =>
    FarmDetail.fromJson(json.decode(str));

String farmDetailToJson(FarmDetail data) => json.encode(data.toJson());

class FarmDetail {
  DateTime createdAt;
  DateTime updatedAt;
  String id;
  String name;
  String businessModel;
  String businessType;
  String province;
  String district;
  String wards;
  String address;
  FarmDetailLocation location;
  String image;
  List<Area>? areas;

  FarmDetail({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.name,
    required this.businessModel,
    required this.businessType,
    required this.province,
    required this.district,
    required this.wards,
    required this.address,
    required this.location,
    required this.image,
    required this.areas,
  });

  factory FarmDetail.fromJson(Map<String, dynamic> json) => FarmDetail(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
        name: json["name"],
        businessModel: json["business_model"],
        businessType: json["business_type"],
        province: json["province"],
        district: json["district"],
        wards: json["wards"],
        address: json["address"],
        location: FarmDetailLocation.fromJson(json["location"]),
        image: json["image"],
        // areas: [],
        areas: json["areas"] != null
            ? List<Area>.from(json["areas"].map((x) => Area.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "id": id,
        "name": name,
        "business_model": businessModel,
        "business_type": businessType,
        "province": province,
        "district": district,
        "wards": wards,
        "address": address,
        "location": location.toJson(),
        "image": image,
        "areas": List<dynamic>.from(areas!.map((x) => x.toJson())),
      };
}

class Area {
  String id;
  String name;
  String description;
  List<LocationElement> locations;
  List<String> avatars;
  int acreage;
  List<Land> lands;

  Area({
    required this.id,
    required this.name,
    required this.description,
    required this.locations,
    required this.avatars,
    required this.acreage,
    required this.lands,
  });

  factory Area.fromJson(Map<String, dynamic> json) => Area(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        locations: List<LocationElement>.from(
            json["locations"].map((x) => LocationElement.fromJson(x))),
        avatars: List<String>.from(json["avatars"].map((x) => x)),
        acreage: json["acreage"],
        lands: List<Land>.from(json["lands"].map((x) => Land.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "locations": List<dynamic>.from(locations.map((x) => x.toJson())),
        "avatars": List<dynamic>.from(avatars.map((x) => x)),
        "acreage": acreage,
        "lands": List<dynamic>.from(lands.map((x) => x.toJson())),
      };
}

class Land {
  DateTime createdAt;
  DateTime updatedAt;
  String id;
  String name;
  int acreage;
  List<String> images;
  List<LocationElement> locations;

  Land({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.name,
    required this.acreage,
    required this.images,
    required this.locations,
  });

  factory Land.fromJson(Map<String, dynamic> json) => Land(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
        name: json["name"],
        acreage: json["acreage"],
        images: List<String>.from(json["images"].map((x) => x)),
        locations: List<LocationElement>.from(
            json["locations"].map((x) => LocationElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "id": id,
        "name": name,
        "acreage": acreage,
        "images": List<dynamic>.from(images.map((x) => x)),
        "locations": List<dynamic>.from(locations.map((x) => x.toJson())),
      };
}

class LocationElement {
  int point;
  double latitude;
  double longitude;

  LocationElement({
    required this.point,
    required this.latitude,
    required this.longitude,
  });

  factory LocationElement.fromJson(Map<String, dynamic> json) =>
      LocationElement(
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

class FarmDetailLocation {
  double latitude;
  double longitude;

  FarmDetailLocation({
    required this.latitude,
    required this.longitude,
  });

  factory FarmDetailLocation.fromJson(Map<String, dynamic> json) =>
      FarmDetailLocation(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}
