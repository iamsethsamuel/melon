import "package:flutter/material.dart";
import "package:melon/routes/user/auth/SignUp.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/functions.dart";

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);
  @override
  VerificationPageState createState() => VerificationPageState();
}

class VerificationPageState extends State<VerificationPage> {
  Object agreed = false;
  List<TextEditingController> controllers = <TextEditingController>[
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  List<FocusNode> focusNodes = <FocusNode>[
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width(context),
        height: height(context),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                top: 21,
                right: 120,
                width: width(context),
                child: Container(
                    width: 114.79,
                    height: 27.96,
                    margin: const EdgeInsets.only(top: 41, left: 48),
                    child: Logo())),
            Positioned(
                top: 125,
                right: 70,
                width: width(context),
                child: Container(
                    child: Column(
                  children: [
                    Container(
                      child: const Text(
                        "Verify Phone Number",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      width: 175,
                      margin: const EdgeInsets.only(top: 5),
                      child: const Text(
                        "OTP Code Send to your Phone Number",
                        style: TextStyle(
                            fontSize: 11, fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ))),
            Positioned(
                top: 200,
                child: Container(
                  width: width(context) - 60,
                  height: 75,
                  child: Row(
                    children: [
                      for (int i = 0; i < 4; i++)
                        Container(
                          width: 75,
                          height: 75,
                          padding: const EdgeInsets.only(right: 10),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                fillColor: AppColors.buttonColor,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.buttonColor,
                                        width: 2),
                                    borderRadius: BorderRadius.circular(12))),
                            controller: controllers[i],
                            focusNode: focusNodes[i],
                            onChanged: (val) {
                              focusNodes[i].nextFocus();
                            },
                          ),
                        )
                    ],
                  ),
                )),
            Positioned(
                top: 623,
                child: AppButton(
                  "Create Account",
                  onPressed: () => push(context, const SignUpPage()),
                )),
          ],
        ),
      ),
    );
  }
}
