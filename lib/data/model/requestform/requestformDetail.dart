// To parse this JSON data, do
//
//     final requestFormDetail = requestFormDetailFromJson(jsonString);

import 'dart:convert';

RequestFormDetail requestFormDetailFromJson(String str) =>
    RequestFormDetail.fromJson(json.decode(str));

String requestFormDetailToJson(RequestFormDetail data) =>
    json.encode(data.toJson());

// class RequestFormDetail {
//     List<Datum> data;
//     Meta meta;

//     RequestFormDetail({
//         required this.data,
//         required this.meta,
//     });

//     factory RequestFormDetail.fromJson(Map<String, dynamic> json) => RequestFormDetail(
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//         meta: Meta.fromJson(json["meta"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//         "meta": meta.toJson(),
//     };
// }

class RequestFormDetail {
  String createdAt;
  String updatedAt;
  String id;
  String name;
  int quantity;
  String description;
  int? status;
  Material material;
  Provider provider;

  RequestFormDetail({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.name,
    required this.quantity,
    required this.description,
    this.status,
    required this.material,
    required this.provider,
  });

  factory RequestFormDetail.fromJson(Map<String, dynamic> json) =>
      RequestFormDetail(
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        id: json["id"],
        name: json["name"],
        quantity: json["quantity"],
        description: json["description"],
        status: json["status"],
        material: Material.fromJson(json["material"]),
        provider: Provider.fromJson(json["provider"]),
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "id": id,
        "name": name,
        "quantity": quantity,
        "description": description,
        "status": status,
        "material": material.toJson(),
        "provider": provider.toJson(),
      };
}

class Material {
  String createdAt;
  String updatedAt;
  String id;
  String name;
  int quantity;
  String description;
  List<String> images;
  MaterialGroup materialGroup;

  Material({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.name,
    required this.quantity,
    required this.description,
    required this.images,
    required this.materialGroup,
  });

  factory Material.fromJson(Map<String, dynamic> json) => Material(
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        id: json["id"],
        name: json["name"],
        quantity: json["quantity"],
        description: json["description"],
        images: List<String>.from(json["images"].map((x) => x)),
        materialGroup: MaterialGroup.fromJson(json["materialGroup"]),
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "id": id,
        "name": name,
        "quantity": quantity,
        "description": description,
        "images": List<dynamic>.from(images.map((x) => x)),
        "materialGroup": materialGroup.toJson(),
      };
}

class MaterialGroup {
  String createdAt;
  String updatedAt;
  String id;
  dynamic key;
  String name;
  dynamic description;
  dynamic childColumn;
  dynamic idParent;
  bool active;

  MaterialGroup({
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

  factory MaterialGroup.fromJson(Map<String, dynamic> json) => MaterialGroup(
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        id: json["id"],
        key: json["key"],
        name: json["name"],
        description: json["description"],
        childColumn: json["child_column"],
        idParent: json["id_parent"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "id": id,
        "key": key,
        "name": name,
        "description": description,
        "child_column": childColumn,
        "id_parent": idParent,
        "active": active,
      };
}

class Provider {
  String createdAt;
  String updatedAt;
  String id;
  String name;
  String address;
  String phoneNumber;
  int debt;
  String description;

  Provider({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.debt,
    required this.description,
  });

  factory Provider.fromJson(Map<String, dynamic> json) => Provider(
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        id: json["id"],
        name: json["name"],
        address: json["address"],
        phoneNumber: json["phoneNumber"],
        debt: json["debt"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "id": id,
        "name": name,
        "address": address,
        "phoneNumber": phoneNumber,
        "debt": debt,
        "description": description,
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
