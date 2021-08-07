import "dart:convert";

import "package:flutter/material.dart";
import "package:melon/models/models.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/functions.dart";
import "package:provider/provider.dart";

class EditName extends StatefulWidget {
  const EditName({Key? key}) : super(key: key);
  @override
  EditNameState createState() => EditNameState();
}

class EditNameState extends State<EditName> {
  final firstName = TextEditingController(),
      otherName = TextEditingController(),
      lastName = TextEditingController();
  bool firstBuild = true;
  @override
  Widget build(BuildContext context) {
    if (firstBuild) {
      firstName.text = context.read<UserModel>().user.firstName.toString();
      otherName.text = context.read<UserModel>().user.otherName.toString();
      lastName.text = context.read<UserModel>().user.lastName.toString();
      firstBuild = false;
    }
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            header(context, "Account Settings"),
            Container(
              width: width(context),
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: <Widget>[
                  Container(
                    width: width(context),
                    child: const Text(
                      "Edit Account",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    width: width(context),
                    child: const Text(
                      "This should be your full legal name as it appears on all your documents.",
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
                    label: "Other Names",
                    controller: otherName,
                  ),
                  CustomTextField(
                    label: "Last Name",
                    controller: lastName,
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 160, bottom: 30)
                  .add(const EdgeInsets.symmetric(horizontal: 30)),
              child: AppButton(
                "Next",
                onPressed: () {
                  activityIndicator(context);
                  postRequest(context, "/updateuser", {
                    "firstName": firstName.text,
                    "lastName": lastName.text,
                    "otherName": otherName.text,
                    "type": "name",
                  }).then((value) {
                    final Map res = jsonDecode(value.data.toString()) as Map;
                    if (res["data"] != null) {
                      context
                          .read<UserModel>()
                          .login(res["data"] as Map<String, dynamic>,);
                      showSnackBar(context, "Name updated successfully");
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
      ),
    );
  }
}
