import "package:flutter/material.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/functions.dart";

class NextOfKin extends StatefulWidget {
  const NextOfKin({Key? key}) : super(key: key);
  @override
  NextOfKinState createState() => NextOfKinState();
}

class NextOfKinState extends State<NextOfKin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
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
                  const CustomTextField(label: "First Name"),
                  const CustomTextField(label: "Surname"),
                  CustomTextField(
                      label: "Relationship",
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
                  const CustomTextField(label: "Phone Number")
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 94, bottom: 30)
                  .add(const EdgeInsets.symmetric(horizontal: 30)),
              child: AppButton(
                "Complete",
                onPressed: () => pop(context),
              ),
            )
          ],
        ),
      ),
    );
  }
}
