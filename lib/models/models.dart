import "package:flutter/material.dart";
import "package:melon/classes/User.dart";

class BiometricsModel extends ChangeNotifier {
  bool enabled = false;

  // ignore: avoid_setters_without_getters
  set state(bool state) {
    enabled = state;
    notifyListeners();
  }
}

class UserModel extends ChangeNotifier {
  User user = User(accountType: "Personal", name:"Seth Samuel");


  void switchAccountType() {
    if (user.accountType == "Personal") {
      user.accountType = "Business";
    } else {
      user.accountType = "Personal";
    }
    notifyListeners();
  }
}
