class UserModel {
  String Id;
  String fname;
  String lname;
  String age;
  String city;
  String mobile;
  String email;
  String password;

  UserModel.allData(
      {this.Id,
      this.fname,
      this.lname,
      this.age,
      this.city,
      this.mobile,
      this.email,
      this.password});

  // String get email => _email;
  //
  // set email(String value) => _email = value;
  //
  // String get password => _password;
  //
  // set password(String value) => _password = value;

  setId(String id) {
    Id = id;
  }

  getId() {
    return Id;
  }

  toMap() {
    return {
      "id": Id,
      "fname": fname,
      "lname": lname,
      "age": age,
      "city": city,
      "mobile": mobile,
      "email": email,
      "password": password
    };
  }
}
