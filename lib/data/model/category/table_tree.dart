import 'dart:convert';

List<TabletreeModel> tabletreeModelFromJson(String str) =>
    List<TabletreeModel>.from(
        json.decode(str).map((x) => TabletreeModel.fromJson(x)));

String tabletreeModelToJson(List<TabletreeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TabletreeModel {
  String? id;
  String? name;
  String? description;
  bool? active;
  List<TabletreeModel>? children;
  String? cate_id;

  TabletreeModel({
    this.id,
    this.name,
    this.description,
    this.active,
    required this.children,
    this.cate_id,
  });

  factory TabletreeModel.fromJson(Map<String, dynamic> json) => TabletreeModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        active: json["active"],
        cate_id: json["cate_id"],
        children: List<TabletreeModel>.from(
            json["children"].map((x) => TabletreeModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "active": active,
        "cate_id": cate_id,
        // "children": List<dynamic>.from(children.map((x) => x.toJson())),
      };
}
