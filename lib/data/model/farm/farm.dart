// To parse this JSON data, do
//
//     final farm = farmFromJson(jsonString);

import 'dart:convert';
import 'package:itfsd/data/model/area/moreLand.dart';

Farm farmFromJson(String str) => Farm.fromJson(json.decode(str));

String farmToJson(Farm data) => json.encode(data.toJson());

class Farm {
  String? id;
  String? name;
  String? businessModel;
  String? businessType;
  String? province;
  String? district;
  String? wards;
  String? address;
  Location? location;
  String? image;

  Farm({
    this.id,
    this.name,
    this.businessModel,
    this.businessType,
    this.province,
    this.district,
    this.wards,
    this.address,
    this.location,
    this.image,
  });

  factory Farm.fromJson(Map<String, dynamic> json) => Farm(
        id: json["id"],
        name: json["name"],
        businessModel: json["business_model"],
        businessType: json["business_type"],
        province: json["province"],
        district: json["district"],
        wards: json["wards"],
        address: json["address"],
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "business_model": businessModel,
        "business_type": businessType,
        "province": province,
        "district": district,
        "wards": wards,
        "address": address,
        "location": location?.toJson(),
        "image": image,
      };
}