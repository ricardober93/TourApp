class UserModel {
  String name = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  String phone = '';
  String address = '';

  constructor({name, email, password, confirmPassword, phone, address}) {
    this.name = name;
    this.email = email;
    this.password = password;
    this.confirmPassword = confirmPassword;
    this.phone = phone;
    this.address = address;
  }

  validate() {
    return true;
  }

  save() {
    return true;
  }
}
