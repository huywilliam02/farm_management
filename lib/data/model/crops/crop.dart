// To parse this JSON data, do
//
//     final cropsDetail = cropsDetailFromJson(jsonString);

import 'dart:convert';

CropsDetail cropsDetailFromJson(String str) =>
    CropsDetail.fromJson(json.decode(str));

String cropsDetailToJson(CropsDetail data) => json.encode(data.toJson());

class CropsDetail {
  DateTime? createdAt;
  DateTime? updatedAt;
  String? id;
  String? name;
  String? disease;
  String? growth;
  String? use;
  String? harvest;
  String? price;
  List<String>? images;
  GroupCrop? groupCrop;

  CropsDetail({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.name,
    this.disease,
    this.growth,
    this.use,
    this.harvest,
    this.price,
    this.images,
    this.groupCrop,
  });

  factory CropsDetail.fromJson(Map<String, dynamic> json) => CropsDetail(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
        name: json["name"],
        disease: json["disease"],
        growth: json["growth"],
        use: json["use"],
        harvest: json["harvest"],
        price: json["price"],
        images: json["images"] != null
            ? List<String>.from(json["images"].map((x) => x))
            : null,
        groupCrop: GroupCrop.fromJson(json["groupCrop"]),
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "id": id,
        "name": name,
        "disease": disease,
        "growth": growth,
        "use": use,
        "harvest": harvest,
        "price": price,
        "images": images != null
            ? List<dynamic>.from(images!.map((x) => x))
            : null, // Handle the null case for images
        "groupCrop": groupCrop,
      };
}

class GroupCrop {
  DateTime createdAt;
  DateTime updatedAt;
  String id;
  dynamic key;
  Name name;
  dynamic description;
  dynamic childColumn;
  dynamic idParent;
  bool active;

  GroupCrop({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.key,
    required this.name,
    required this.description,
    required this.childColumn,
    required this.idParent,
    required this.active,
  });

  factory GroupCrop.fromJson(Map<String, dynamic> json) => GroupCrop(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
        key: json["key"],
        name: nameValues.map[json["name"]]!,
        description: json["description"],
        childColumn: json["child_column"],
        idParent: json["id_parent"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "id": id,
        "key": key,
        "name": nameValues.reverse[name],
        "description": description,
        "child_column": childColumn,
        "id_parent": idParent,
        "active": active,
      };
}

enum Name { QU_C }

final nameValues = EnumValues({"Quả - Củ": Name.QU_C});

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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
