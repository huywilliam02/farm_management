// To parse this JSON data, do
//
//     final soilType = soilTypeFromJson(jsonString);

import 'dart:convert';

List<SoilType> soilTypeFromJson(String str) => List<SoilType>.from(json.decode(str).map((x) => SoilType.fromJson(x)));

String soilTypeToJson(List<SoilType> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SoilType {
    String? id;
    String? name;

    SoilType({
        this.id,
        this.name,
    });

    factory SoilType.fromJson(Map<String, dynamic> json) => SoilType(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
