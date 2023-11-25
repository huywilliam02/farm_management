// To parse this JSON data, do
//
//     final workindayModel = workindayModelFromJson(jsonString);

import 'dart:convert';

WorkindayModel workindayModelFromJson(String str) =>
    WorkindayModel.fromJson(json.decode(str));

String workindayModelToJson(WorkindayModel data) => json.encode(data.toJson());

class WorkindayModel {
  String implementAt;
  String completedAt;
  String job;
  String description;
  String? land;
  String crop;

  WorkindayModel({
    required this.implementAt,
    required this.completedAt,
    required this.job,
    required this.description,
    this.land,
    required this.crop,
  });

  factory WorkindayModel.fromJson(Map<String, dynamic> json) => WorkindayModel(
        implementAt: json["implement_at"],
        completedAt: json["completed_at"],
        job: json["job"],
        description: json["description"],
        land: json["land"],
        crop: json["crop"],
      );

  Map<String, dynamic> toJson() => {
        "implement_at": implementAt,
        "completed_at": completedAt,
        "job": job,
        "description": description,
        "land": land,
        "crop": crop,
      };
}
