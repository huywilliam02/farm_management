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
        createdAt: json["createdAt"] != null
            ? DateTime.parse(json["createdAt"])
            : null,
        updatedAt: json["updatedAt"] != null
            ? DateTime.parse(json["updatedAt"])
            : null,
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
        groupCrop: json["groupCrop"] != null
            ? GroupCrop.fromJson(json["groupCrop"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "id": id,
        "name": name,
        "disease": disease,
        "growth": growth,
        "use": use,
        "harvest": harvest,
        "price": price,
        "images":
            images != null ? List<dynamic>.from(images!.map((x) => x)) : null,
        "groupCrop": groupCrop?.toJson(), // <-- Corrected line
      };
}

class GroupCrop {
  DateTime createdAt;
  DateTime updatedAt;
  String id;
  dynamic key;
  String name;
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
        createdAt: json["createdAt"] != null
            ? DateTime.parse(json["createdAt"])
            : DateTime.now(),
        updatedAt: json["updatedAt"] != null
            ? DateTime.parse(json["updatedAt"])
            : DateTime.now(),
        id: json["id"] ?? '',
        key: json["key"],
        name: json["name"] ?? '',
        description: json["description"],
        childColumn: json["child_column"],
        idParent: json["id_parent"],
        active: json["active"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "id": id,
        "key": key,
        "name": name,
        "description": description,
        "child_column": childColumn,
        "id_parent": idParent,
        "active": active,
      };
}
