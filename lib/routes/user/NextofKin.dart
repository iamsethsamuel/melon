import 'dart:convert';

import "package:flutter/material.dart";
import 'package:melon/models/models.dart';
import 'package:melon/routes/user/Profile.dart';
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/functions.dart";
import "package:provider/provider.dart";

class NextOfKin extends StatefulWidget {
  const NextOfKin({Key? key}) : super(key: key);
  @override
  NextOfKinState createState() => NextOfKinState();
}

class NextOfKinState extends State<NextOfKin> {
  final firstName = TextEditingController(),
      surname = TextEditingController(),
      relationship = TextEditingController(),
      phone = TextEditingController();
  final List<String> relationships = [
    "Brother",
    "Sister",
    "Father",
    "Mother",
    "Cousin",
    "Friend"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                header(context, "Next of Kin"),
                Container(
                  width: width(context),
                  margin: const EdgeInsets.only(top: 30),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: width(context),
                        child: const Text(
                          "Input Next of Kin Details",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        width: width(context),
                        child: const Text(
                          "Please enter your all neccessary information about your next of kin",
                          style: TextStyle(fontSize: 11),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      CustomTextField(
                        label: "First Name",
                        controller: firstName,
                      ),
                      CustomTextField(
                        label: "Surname",
                        controller: surname,
                      ),
                      CustomTextField(
                          readOnly: true,
                          onTap: () {
                            showSnackBar(
                                context,
                                Container(
                                  width: width(context),
                                  height: height(context) / 3,
                                  child: ListView.builder(
                                      itemCount: relationships.length,
                                      itemBuilder: (_, index) {
                                        return TextButton(
                                          onPressed: () {
                                            relationship.text =
                                                relationships[index];
                                            removeSnackBar(context);
                                          },
                                          child: Text(
                                            relationships[index],
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        );
                                      }),
                                ),
                                duration: const Duration(days: 1));
                          },
                          label: "Relationship",
                          controller: relationship,
                          suffix: TextButton(
                              style: TextButton.styleFrom(
                                  primary: AppColors.primaryColor),
                              onPressed: () {},
                              child: Container(
                                  width: 10,
                                  child: const RotatedBox(
                                    quarterTurns: 3,
                                    child: Icon(
                                      Icons.arrow_back_ios_new,
                                      color: AppColors.primaryColor,
                                    ),
                                  )))),
                      CustomTextField(
                        label: "Phone Number",
                        controller: phone,
                        textInputType: TextInputType.phone,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 94, bottom: 30)
                      .add(const EdgeInsets.symmetric(horizontal: 30)),
                  child: AppButton(
                    "Complete",
                    onPressed: () {
                      activityIndicator(context);
                      postRequest(context, "/updateuser", {
                        "firstName": firstName.text,
                        "surname": surname.text,
                        "phone": phone.text,
                        "relationship": relationship.text,
                        "type": "nextofkin",
                      }).then((value) {
                        final Map res =
                            jsonDecode(value.data.toString()) as Map;
                        if (res["data"] != null) {
                          context.read<UserModel>().login(
                                res["data"] as Map<String, dynamic>,
                              );
                          showSnackBar(
                              context, "Next of Kin updated successfully");
                          push(context, AccountProfile());
                        } else {
                          showSnackBar(context, res["err"]);
                        }
                      }).catchError((err) {
                        print(err);
                        showSnackBar(context, "Sorry an error occurred");
                      });
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
