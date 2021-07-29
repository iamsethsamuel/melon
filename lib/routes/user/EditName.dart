import "package:flutter/material.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/functions.dart";

class EditName extends StatefulWidget {
  const EditName({Key? key}) : super(key: key);
  @override
  EditNameState createState() => EditNameState();
}

class EditNameState extends State<EditName> {
  @override
  Widget build(BuildContext context) {
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
                children: const <Widget>[
                  CustomTextField(label: "First Name"),
                  CustomTextField(label: "Other Names"),
                  CustomTextField(label: "Last Name")
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 160, bottom: 30)
                  .add(const EdgeInsets.symmetric(horizontal: 30)),
              child: AppButton(
                "Next",
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
