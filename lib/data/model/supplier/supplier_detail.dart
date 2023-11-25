// To parse this JSON data, do
//
//     final supplierDetail = supplierDetailFromJson(jsonString);

import 'dart:convert';

SupplierDetail supplierDetailFromJson(String str) => SupplierDetail.fromJson(json.decode(str));

String supplierDetailToJson(SupplierDetail data) => json.encode(data.toJson());

class SupplierDetail {
    DateTime createdAt;
    DateTime updatedAt;
    String id;
    String name;
    String address;
    String phoneNumber;
    int debt;
    String description;

    SupplierDetail({
        required this.createdAt,
        required this.updatedAt,
        required this.id,
        required this.name,
        required this.address,
        required this.phoneNumber,
        required this.debt,
        required this.description,
    });

    factory SupplierDetail.fromJson(Map<String, dynamic> json) => SupplierDetail(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
        name: json["name"],
        address: json["address"],
        phoneNumber: json["phoneNumber"],
        debt: json["debt"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
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
