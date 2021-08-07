class User {
  User(
      {this.accountType,
      this.address,
      this.firstName,
      this.lastName,
      this.middleName,
      this.email,
      this.phone,
      this.name,
      this.id,
      this.location,
      this.nextofkin,
      this.otherName,
      this.sessionid,
      this.street,
      this.country,
      this.state,
      this.city,
      this.pic});
  User.fromJson(Map<String, dynamic> json)
      : firstName = json["firstName"].toString(),
        id = json["_id"].toString(),
        email = json["email"].toString(),
        lastName = json["lastName"].toString(),
        pic = json["pic"].toString(),
        name =
            "${json["firstName"].toString()} ${json["otherName"] != null ? json["otherName"].toString() : ""}  ${json["lastName"].toString()}",
        middleName = json["middleName"].toString(),
        otherName = json["otherName"].toString(),
        phone = json["phone"].toString(),
        city = json["city"].toString(),
        state = json["state"].toString(),
        street = json["street"].toString(),
        country = json["country"].toString(),
        location = json["location"].toString(),
        nextofkin = json["nextofkin"] != null ? json["nextofkin"] as Map : {},
        address = json["city"] != null
            ? "${json["street"]} ${json["city"]}, ${json["country"]}, ${json["country"]}"
            : "null",
        accountType = json["accounttype"].toString(),
        sessionid = json["sessionid"].toString();
  String? firstName;
  String? lastName;
  String? middleName;
  String? phone;
  String? address,
      email,
      location,
      otherName,
      country,
      city,
      street,
      state,
      pic;
  String? accountType;
  String? name;
  String? id, sessionid;
  Map? nextofkin;
}

class Wallet {
  Wallet({this.balance, this.records, this.user});
  Wallet.fromJSON(Map<String, dynamic> json)
      : balance = json["balance"].runtimeType == int
            ? json["balance"] as int
            : int.parse(json["balance"].toString()),
        user = json["user"].toString(),
        records = json["records"] == null ? [] : json["records"] as List;
  int? balance;
  String? user;
  List? records;
}
