// To parse this JSON data, do
//
//     final landDetail = landDetailFromJson(jsonString);

import 'dart:convert';

LandDetail landDetailFromJson(String str) =>
    LandDetail.fromJson(json.decode(str));

String landDetailToJson(LandDetail data) => json.encode(data.toJson());

class LandDetail {
  String? id;
  String? name;
  int? acreage;
  List<String>? images;
  List<Location>? locations;
  Area? area;
  ProductType? productType;
  Area? soilType;

  LandDetail({
    this.id,
    this.name,
    this.acreage,
    this.images,
    this.locations,
    this.area,
    this.productType,
    this.soilType,
  });

  factory LandDetail.fromJson(Map<String, dynamic> json) => LandDetail(
        id: json["id"],
        name: json["name"],
        acreage: json["acreage"],
        images: List<String>.from(json["images"].map((x) => x)),
        locations: List<Location>.from(
            json["locations"].map((x) => Location.fromJson(x))),
        area: Area.fromJson(json["area"]),
        productType: ProductType.fromJson(json["productType"]),
        soilType: Area.fromJson(json["soilType"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "acreage": acreage,
        "images": List<dynamic>.from(images!.map((x) => x)),
        "locations": List<dynamic>.from(locations!.map((x) => x.toJson())),
        "area": area!.toJson(),
        "productType": productType!.toJson(),
        "soilType": soilType!.toJson(),
      };
}

class Area {
  String id;
  String name;

  Area({
    required this.id,
    required this.name,
  });

  factory Area.fromJson(Map<String, dynamic> json) => Area(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Location {
  int point;
  double latitude;
  double longitude;

  Location({
    required this.point,
    required this.latitude,
    required this.longitude,
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
  String id;
  String name;
  ChildColumn childColumn;

  ProductType({
    required this.id,
    required this.name,
    required this.childColumn,
  });

  factory ProductType.fromJson(Map<String, dynamic> json) => ProductType(
        id: json["id"],
        name: json["name"],
        childColumn: ChildColumn.fromJson(json["child_column"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "child_column": childColumn.toJson(),
      };
}

class ChildColumn {
  String color;

  ChildColumn({
    required this.color,
  });

  factory ChildColumn.fromJson(Map<String, dynamic> json) => ChildColumn(
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "color": color,
      };
}
