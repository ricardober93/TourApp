class UserModel {
  int id;
  String name;
  String email;
  String phone;
  String address;
  Rol role;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.role,
  });

  validate() {
    return true;
  }

  save() {
    return true;
  }
}

enum Rol { admin, user }
