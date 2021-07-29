import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:melon/routes/user/Profile.dart";
import "package:melon/routes/user/auth/VerificationPage.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/functions.dart";

class UpdateNumber extends StatefulWidget {
  const UpdateNumber({Key? key}) : super(key: key);
  @override
  UpdateNumberState createState() => UpdateNumberState();
}

class UpdateNumberState extends State<UpdateNumber> {
  Widget confirmationPageHeader(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          children: [
            Container(
              width: width(context),
              child: const Text(
                "Update your Phone Number",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              width: width(context),
              margin: const EdgeInsets.only(top: 10),
              child: const Text(
                "Please enter your new phone number",
                style: TextStyle(fontSize: 11),
              ),
            ),
          ],
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            header(context, "Phone Number"),
            Container(
              width: width(context),
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: <Widget>[
                  Container(
                    width: width(context),
                    child: const Text(
                      "Update your Phone Number",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    width: width(context),
                    margin: const EdgeInsets.only(top: 10),
                    child: const Text(
                      "Please enter your new phone number",
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 40),
                      child: Column(children: [
                        CustomTextField(
                          label: "Phone Number",
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
                      ]))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 350, bottom: 50)
                  .add(const EdgeInsets.symmetric(horizontal: 20)),
              child: AppButton(
                "Next",
                onPressed: () => push(
                    context,
                    VerificationPage(
                      message: "Confirmed",
                      header: confirmationPageHeader(context),
                      title: header(context, "Phone Number"),
                      redirectionPage: AccountProfile(),
                      trailing: Container(
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            children: const <Widget>[
                              Text("Resend OTP "),
                              CountDown(
                                duration: 210,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
