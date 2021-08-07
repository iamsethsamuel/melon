import 'dart:convert';

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import 'package:melon/models/models.dart';
import "package:melon/routes/user/Profile.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/functions.dart";
import "package:provider/provider.dart";

class UpdateEmail extends StatefulWidget {
  const UpdateEmail({Key? key}) : super(key: key);
  @override
  UpdateEmailState createState() => UpdateEmailState();
}

class UpdateEmailState extends State<UpdateEmail> {
  final email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                header(context, "Email Address"),
                Container(
                  width: width(context),
                  margin: const EdgeInsets.only(top: 30),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: width(context),
                        child: const Text(
                          "Please enter your Email Address",
                          style:
                              TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        width: width(context),
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                          "Please enter your new Email Email",
                          style: TextStyle(fontSize: 11),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 40),
                          child: Column(children: [
                            CustomTextField(
                              textCapitalization: TextCapitalization.none,
                              controller: email,
                              label: "Email Address",
                            )
                          ]))
                    ],
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 380, bottom: 30)
                        .add(const EdgeInsets.symmetric(horizontal: 30)),
                    child: AppButton(
                      "Confirmed",
                      onPressed: () {
                        activityIndicator(context);
                        postRequest(context, "/updateuser", {
                          "email": email.text,
                          "type": "email",
                        }).then((value) {
                          final Map res = jsonDecode(value.data.toString()) as Map;
                          if (res["data"] != null) {
                            context.read<UserModel>().login(
                                  res["data"] as Map<String, dynamic>,
                                );
                            showSnackBar(context, "Email updated successfully");
                            push(context, AccountProfile());
                          } else {
                            showSnackBar(context, res["err"]);
                          }
                        }).catchError((err) {
                          print(err);
                          showSnackBar(context, "Sorry an error occurred");
                        });
                      },
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
