import 'dart:convert';

List<MorelandModel> morelandModelFromJson(String str) =>
    List<MorelandModel>.from(
        json.decode(str).map((x) => MorelandModel.fromJson(x)));

String morelandModelToJson(List<MorelandModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MorelandModel {
  String id;
  String name;
  String description;
  List<Location> locations;
  List<String>? avatars;
  double acreage;
  String? farmId;

  MorelandModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.locations,
      this.avatars,
      required this.acreage,
      this.farmId = ''});

  factory MorelandModel.fromJson(Map<String, dynamic> json) => MorelandModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        locations: List<Location>.from(
            json["locations"].map((x) => Location.fromJson(x))),
        avatars: json["avatars"] == null
            ? []
            : List<String>.from(json["avatars"]!.map((x) => x)),
        acreage: json["acreage"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "locations": List<dynamic>.from(locations.map((x) => x.toJson())),
        // "avatars": avatars == null ? [] : List<dynamic>.from(avatars!.map((x) => x)),
        "acreage": acreage,
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
        point: json["point"] ?? 0,
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "point": point,
        "latitude": latitude,
        "longitude": longitude,
      };
}
