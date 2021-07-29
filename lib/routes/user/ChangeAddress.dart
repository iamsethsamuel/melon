import "package:flutter/material.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/functions.dart";

class ChangeAddress extends StatefulWidget {
  const ChangeAddress({Key? key}) : super(key: key);
  @override
  ChangeAddressState createState() => ChangeAddressState();
}

class ChangeAddressState extends State<ChangeAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            header(context, "Address"),
            Container(
              width: width(context),
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: <Widget>[
                  Container(
                    width: width(context),
                    child: const Text(
                      "Change your address",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    width: width(context),
                    child: const Text(
                      "Please enter your new resodential address",
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
                  const CustomTextField(label: "Street"),
                  const CustomTextField(label: "City"),
                  const CustomTextField(label: "State"),
                  CustomTextField(
                    label: "Country",
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
                            ))),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 100)
                  .add(const EdgeInsets.symmetric(horizontal: 30)),
              child: AppButton(
                "Complete",
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
