import 'dart:convert';

import "package:flutter/material.dart";
import 'package:melon/classes/classes.dart';
import 'package:melon/main.dart';
import 'package:melon/utils/functions.dart';

class BiometricsModel extends ChangeNotifier {
  bool enabled = false;

  // ignore: avoid_setters_without_getters
  set state(bool state) {
    enabled = state;
    notifyListeners();
  }
}

class UserModel extends ChangeNotifier {
  User user = User(accountType: "Personal");
  String sessionId = "";
  void switchAccountType() {
    if (user.accountType == "Personal") {
      user.accountType = "Business";
    } else {
      user.accountType = "Personal";
    }
    notifyListeners();
  }

  Future<void> login(Map<String, dynamic> userJson,
      {bool notify = true}) async {
    user = User.fromJson(userJson);
    sessionId = user.sessionid!;
    if (notify) notifyListeners();
    return;
  }

  Future<String> getSessionID() async {
    await storage.read(key: "user").then((val) {
      if (val != null) {
        final Map decoded = jsonDecode(val) as Map;
        user = User.fromJson(decoded as Map<String, dynamic>);
        sessionId = user.sessionid!;
        notifyListeners();
      }
    });
    return sessionId;
  }
}

class WalletModel extends ChangeNotifier {
  Wallet wallet = Wallet();

  void getWallet(Map<String, dynamic> json, {bool notify = true}) {
    wallet = Wallet.fromJSON(json);

    if (notify) notifyListeners();
  }

  Future updateWallet(BuildContext context) async {
    return getRequest(context, "/wallet");
  }
}
