// To parse this JSON data, do
//
//     final customerDetail = customerDetailFromJson(jsonString);

import 'dart:convert';

CustomerDetail customerDetailFromJson(String str) => CustomerDetail.fromJson(json.decode(str));

String customerDetailToJson(CustomerDetail data) => json.encode(data.toJson());

// class CustomerDetail {
//     List<Datum> data;
//     Meta meta;

//     CustomerDetail({
//         required this.data,
//         required this.meta,
//     });

//     factory CustomerDetail.fromJson(Map<String, dynamic> json) => CustomerDetail(
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//         meta: Meta.fromJson(json["meta"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//         "meta": meta.toJson(),
//     };
// }

class CustomerDetail {
    String createdAt;
    String updatedAt;
    String id;
    String name;
    int quantity;
    String receptionDay;
    String description;
    int status;

    CustomerDetail({
        required this.createdAt,
        required this.updatedAt,
        required this.id,
        required this.name,
        required this.quantity,
        required this.receptionDay,
        required this.description,
        required this.status,
    });

    factory CustomerDetail.fromJson(Map<String, dynamic> json) => CustomerDetail(
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        id: json["id"],
        name: json["name"],
        quantity: json["quantity"],
        receptionDay: json["receptionDay"],
        description: json["description"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "id": id,
        "name": name,
        "quantity": quantity,
        "receptionDay": receptionDay,
        "description": description,
        "status": status,
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
