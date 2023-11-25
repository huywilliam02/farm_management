// To parse this JSON data, do
//
//     final unit = unitFromJson(jsonString);

import 'dart:convert';

List<UnitModel> unitFromJson(String str) =>
    List<UnitModel>.from(json.decode(str).map((x) => UnitModel.fromJson(x)));

String unitToJson(List<UnitModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UnitModel {
  String id;
  String name;
  String description;
  bool active;

  UnitModel({
    required this.id,
    required this.name,
    required this.description,
    required this.active,
  });

  factory UnitModel.fromJson(Map<String, dynamic> json) => UnitModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "active": active,
      };
}
