
class Login {
  int? id;
  String? fullName;
  String? username;
  bool? isLocked;
  DateTime? createdAt;
  DateTime? updatedAt;
  Login({
    this.id = 0,
    this.fullName = "",
    this.username = "",
    this.isLocked = false,
    this.createdAt,
    this.updatedAt,
  });
}
