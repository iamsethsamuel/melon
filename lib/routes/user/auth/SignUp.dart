import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:melon/routes/user/auth/LoginPage.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/functions.dart";

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  Object agreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width(context),
        height: height(context),
        child: ListView(
          children: [
            Container(
              width: width(context),
              margin: const EdgeInsets.only(top: 60),
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                const   SizedBox(
                      width: 105,
                      height: 30,
                      child: Logo()),
                  Container(
                      padding: const EdgeInsets.only(left: 30, top: 20),
                      margin: const EdgeInsets.only(bottom: 30),
                      child: Column(
                        children: [
                          Container(
                            child: const Text(
                              "Create an Account",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                          ),
                          Container(
                            width: 140,
                            margin: const EdgeInsets.only(top: 5),
                            child: const Text(
                              "It only takes few seconds",
                              style: TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              height: (height(context) / 2) + 40,
              width: width(context) - 60,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          filled: false,
                          border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.fadedPrimary)),
                          hintText: "First Name",
                          hintStyle: TextStyle(fontSize: 11)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          filled: false,
                          hintText: "Last Name",
                          hintStyle: TextStyle(fontSize: 11)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          filled: false,
                          hintText: "Email Address",
                          hintStyle: TextStyle(fontSize: 11)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Phone Number",
                          filled: false,
                          hintStyle: TextStyle(fontSize: 11)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          filled: false,
                          hintText: "Password",
                          hintStyle: TextStyle(fontSize: 11)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          filled: false,
                          hintText: "Re-type Password",
                          hintStyle: TextStyle(fontSize: 11)),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      height: 60,
                      child: Row(
                        children: [
                         const  MaterialRadio(
                            color: AppColors.primaryColor,
                            size: 18,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            width: width(context) - 95,
                            height: 12,
                            child: Row(
                              children: const <Widget>[
                                Text(
                                  "I have read the ",
                                  style: TextStyle(
                                      fontSize: 11.7,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "terms and conditions",
                                  style: TextStyle(
                                      fontSize: 11.7,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: AppButton(
                  "Create Account",
                  onPressed: () {},
                )),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              alignment: Alignment.centerLeft,
              width: width(context),
              child: GestureDetector(
                  onTap: () => push(context, const LoginPage()),
                  child: Stack(
                    children: [
                      const Text(
                        """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suscipit\n\r dolor amet enim sed. Eu ante elementum, aenean quis.""",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize:11),
                      ),
                      Positioned(right: 0, bottom: 0,
                        child: Container(
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
