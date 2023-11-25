class SignUpModel {
  String? fullName;
  String? username;
  String? password;
  String? createdAt;
  String? updatedAt;
  String? id;
  bool? isLocked;

  SignUpModel(
      {this.fullName,
      this.username,
      this.password,
      this.createdAt,
      this.updatedAt,
      this.id,
      this.isLocked});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    username = json['username'];
    password = json['password'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
    isLocked = json['isLocked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullName'] = fullName;
    data['username'] = username;
    data['password'] = password;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['id'] = id;
    data['isLocked'] = isLocked;
    return data;
  }
}
