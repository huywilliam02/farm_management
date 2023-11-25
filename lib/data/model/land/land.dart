// To parse this JSON data, do
//
//     final landDivision = landDivisionFromJson(jsonString);

import 'dart:convert';

import 'package:itfsd/data/model/area/moreLand.dart';

LandDivision landDivisionFromJson(String str) =>
    LandDivision.fromJson(json.decode(str));

String landDivisionToJson(LandDivision data) => json.encode(data.toJson());

class LandDivision {
  String? id;
  String? name;
  int? acreage;
  List<String>? images;
  List<Location>? locations;
  Area? area;
  ProductType? productType;
  String? solidTypeId;
  // Area? soilType;

  LandDivision({
    this.id,
    this.name,
    this.acreage,
    this.images,
    this.locations,
    this.area,
    this.productType,
    this.solidTypeId,
  });

  factory LandDivision.fromJson(Map<String, dynamic> json) => LandDivision(
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
        area: json["area"] == null ? null : Area.fromJson(json["area"]),
        productType: json["productType"] == null
            ? null
            : ProductType.fromJson(json["productType"]),
        // soilType:
        //     json["soilType"] == null ? null : Area.fromJson(json["soilType"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "acreage": acreage,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "locations": locations == null
            ? []
            : List<dynamic>.from(locations!.map((x) => x.toJson())),
        "area": area?.toJson(),
        "productType": productType?.toJson(),
        // "soilType": soilType?.toJson(),
      };
}

class Area {
  String? id;
  String? name;

  Area({
    this.id,
    this.name,
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

class ProductType {
  String? id;
  String? name;
  ChildColumn? childColumn;

  ProductType({
    this.id,
    this.name,
    this.childColumn,
  });

  factory ProductType.fromJson(Map<String, dynamic> json) => ProductType(
        id: json["id"],
        name: json["name"],
        childColumn: json["child_column"] == null
            ? null
            : ChildColumn.fromJson(json["child_column"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "child_column": childColumn?.toJson(),
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
