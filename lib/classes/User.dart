class User {
  User(
      {this.accountType,
      this.address,
      this.firstName,
      this.lastName,
      this.middleName,
      this.phone,
      this.name});
  String? firstName;
  String? lastName;
  String? middleName;
  String? phone;
  String? address;
  String? accountType;
  String? name;
  // ignore: sort_constructors_first
  User.fromJson(Map<String, String> json)
      : firstName = json["firstName"],
        lastName = json["lastName"],
        name = json["firstName"]! + json["lastName"]!,
        middleName = json["middleName"],
        phone = json["phone"],
        address = json["address"],
        accountType = json["accountType"];
}
