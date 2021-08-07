import "dart:convert";

import "package:flutter/material.dart";
import "package:melon/main.dart";
import "package:melon/models/models.dart";
import "package:melon/routes/home/HomePage.dart";
import "package:melon/routes/home/SecurityPage.dart";
import "package:melon/routes/user/auth/LoginPage.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/data.dart";
import "package:melon/utils/functions.dart";
import "package:provider/provider.dart";

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String accountType =
        context.read<UserModel>().user.accountType == "Business"
            ? "Personal"
            : "Business";
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: width(context),
          height: 25,
          margin: const EdgeInsets.only(left: 30, top: 10, bottom: 30),
          child: const Logo(),
        ),
        for (int i = 0; i < menu.length; i++)
          Container(
            margin: const EdgeInsets.only(left: 30),
            child: TextButton(
              onPressed: () {
                if (i == 0) {
                  push(
                      context,
                      const HomePage(
                        page: 2,
                      ));
                } else if (i == 3) {
                  showSnackBar(context, const SecurityPage(),
                      duration: const Duration(days: 1));
                } else if (i == 8) {
                  storage.deleteAll().then(
                      (value) => pushReplacement(context, const LoginPage()));
                } else {
                  push(context, menuPageRoute[i]);
                }
              },
              child: Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: menu[i]["icon"],
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: menu[i]["name"],
                  )
                ],
              ),
            ),
          ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
          width: 124,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.primaryColor,
          ),
          margin: const EdgeInsets.only(left: 30, right: 180),
          child: TextButton(
            style: TextButton.styleFrom(primary: AppColors.primaryColor),
            onPressed: () {
              activityIndicator(context);
              postRequest(context, "/updateuser", {
                "accounttype": accountType,
                "type": "accounttype",
              }).then((value) {
                final Map res = jsonDecode(value.data.toString()) as Map;
                if (res["data"] != null) {
                  context.read<UserModel>().login(
                        res["data"] as Map<String, dynamic>,
                      );
                  showSnackBar(
                      context, "Switched to $accountType account successfully");
                  push(context, MyApp());
                } else {
                  showSnackBar(context, res["err"]);
                }
              }).catchError((err) {
                print(err);
                showSnackBar(context, "Sorry an error occurred");
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Icon(
                  Icons.launch,
                  color: Colors.white,
                ),
                Column(
                  children: <Widget>[
                    const Text(
                      "Switch to",
                      style:
                          TextStyle(fontSize: 16, color: AppColors.buttonColor),
                    ),
                    Text(
                      accountType,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
