// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    DateTime? createdAt;
    DateTime? updatedAt;
    String? id;
    String? key;
    String? name;
    String? description;
    ChildColumn? childColumn;
    String? idParent;
    bool? active;

    Product({
        this.createdAt,
        this.updatedAt,
        this.id,
        this.key,
        this.name,
        this.description,
        this.childColumn,
        this.idParent,
        this.active,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        id: json["id"],
        key: json["key"],
        name: json["name"],
        description: json["description"],
        childColumn: json["child_column"] == null ? null : ChildColumn.fromJson(json["child_column"]),
        idParent: json["id_parent"],
        active: json["active"],
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "id": id,
        "key": key,
        "name": name,
        "description": description,
        "child_column": childColumn?.toJson(),
        "id_parent": idParent,
        "active": active,
    };
}

class ChildColumn {
    String? color;

    ChildColumn({
        this.color,
    });

    factory ChildColumn.fromJson(Map<String, dynamic> json) => ChildColumn(
        color: json["color"],
    );

    Map<String, dynamic> toJson() => {
        "color": color,
    };
}
