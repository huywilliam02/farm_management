// To parse this JSON data, do
//
//     final workindayDetail = workindayDetailFromJson(jsonString);

import 'dart:convert';

WorkindayDetail workindayDetailFromJson(String str) =>
    WorkindayDetail.fromJson(json.decode(str));

String workindayDetailToJson(WorkindayDetail data) =>
    json.encode(data.toJson());

class WorkindayDetail {
  DateTime? createdAt;
  DateTime? updatedAt;
  String? id;
  DateTime? implementAt;
  String? completedAt;
  String? job;
  String? description;
  Land? land;
  Crop? crop;

  WorkindayDetail({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.implementAt,
    required this.completedAt,
    required this.job,
    required this.description,
    required this.land,
    required this.crop,
  });

  factory WorkindayDetail.fromJson(Map<String, dynamic> json) =>
      WorkindayDetail(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
        implementAt: DateTime.parse(json["implement_at"]),
        completedAt: json["completed_at"],
        job: json["job"],
        description: json["description"],
        land: json["land"] == null ? null : Land.fromJson(json["land"]),
        crop: json["crop"] == null ? null : Crop.fromJson(json["crop"]),
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "id": id,
        "implement_at": implementAt,
        "completed_at": completedAt,
        "job": job,
        "description": description,
        "land": land,
        "crop": crop?.toJson(),
      };
}

class Crop {
  DateTime createdAt;
  DateTime updatedAt;
  String id;
  String name;
  String disease;
  String growth;
  String use;
  String harvest;
  String price;
  List<String> images;

  Crop({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.name,
    required this.disease,
    required this.growth,
    required this.use,
    required this.harvest,
    required this.price,
    required this.images,
  });

  factory Crop.fromJson(Map<String, dynamic> json) => Crop(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
        name: json["name"],
        disease: json["disease"],
        growth: json["growth"],
        use: json["use"],
        harvest: json["harvest"],
        price: json["price"],
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "id": id,
        "name": name,
        "disease": disease,
        "growth": growth,
        "use": use,
        "harvest": harvest,
        "price": price,
        "images": List<dynamic>.from(images.map((x) => x)),
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
