import 'dart:convert';

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:melon/routes/user/auth/LoginPage.dart";
import "package:melon/routes/user/auth/VerificationPage.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/functions.dart";

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  Object agreed = false;
  bool? confirmed;
  final _formKey = GlobalKey<FormState>();

  TextEditingController firstName = TextEditingController(),
      lastName = TextEditingController(),
      email = TextEditingController(),
      phone = TextEditingController(),
      password = TextEditingController(),
      confirmpassword = TextEditingController();
  bool accept = false;
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
              margin: const EdgeInsets.only(top: 60)
                  .add(const EdgeInsets.symmetric(horizontal: 30)),
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Container(
                    width: width(context),
                    height: 30,
                    alignment: Alignment.topLeft,
                    child: const Logo(
                      logowidth: 105,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(top: 20),
                      margin: const EdgeInsets.only(bottom: 30),
                      width: width(context),
                      alignment: Alignment.centerLeft,
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
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: TextFormField(
                        controller: firstName,
                        textCapitalization: TextCapitalization.words,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 2) {
                            return "First name is required";
                          }
                        },
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
                        controller: lastName,
                        textCapitalization: TextCapitalization.words,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 2) {
                            return "Last name is required";
                          }
                        },
                        decoration: const InputDecoration(
                            filled: false,
                            hintText: "Last Name",
                            hintStyle: TextStyle(fontSize: 11)),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: TextFormField(
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.contains(RegExp(
                                  r"^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$")) ==
                              false) {
                            return "Please enter a valid email address";
                          }
                        },
                        decoration: const InputDecoration(
                            filled: false,
                            hintText: "Email Address",
                            hintStyle: TextStyle(fontSize: 11)),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: TextFormField(
                        controller: phone,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty ||
                              !(value.length >= 11 && value.length <= 14)) {
                            return "Phone number is invalid";
                          }
                        },
                        decoration: const InputDecoration(
                            hintText: "Phone Number",
                            filled: false,
                            hintStyle: TextStyle(fontSize: 11)),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: TextFormField(
                        controller: password,
                        obscureText: true,
                        validator: (value) {
                          if (value?.contains(RegExp(
                                  r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$")) ==
                              false) {
                            return "Password must contain a number an upper and lowercase letter and a symbol ";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            filled: false,
                            hintText: "Password",
                            hintStyle: TextStyle(fontSize: 11)),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: TextFormField(
                        obscureText: true,
                        controller: confirmpassword,
                        validator: (value) {
                          if (value != password.text) {
                            return "Passwords does not match";
                          }
                        },
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
                            MaterialRadio(
                              color: AppColors.primaryColor,
                              size: 20,
                              onChange: (bool selected) {
                                setState(() {
                                  confirmed = selected != true;
                                });
                              },
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
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: AppButton(
                  "Create Account",
                  disenabled: confirmed != false,
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    showSnackBar(context, const LinearProgressIndicator(),
                        duration: const Duration(days: 1));

                    if (!_formKey.currentState!.validate()) return;
                    final Map<String, String> data = {
                      "firstName": firstName.text,
                      "lastName": lastName.text,
                      "email": email.text,
                      "phone": phone.text,
                      "password": password.text
                    };
                    postRequest(context, "/verifynumber", {"phone": phone.text})
                        .then((value) async {
                      removeSnackBar(context);

                      final Map<String, dynamic> res =
                          jsonDecode(value.data.toString())
                              as Map<String, dynamic>;
                      if (res["data"] != null) {
                        pushReplacement(context, VerificationPage(user: data));
                      } else {
                        showSnackBar(context, res["err"].toString());
                      }
                    }).catchError((err) {
                      showSnackBar(context,
                          "An error occurred while sending OTP. Try again");
                    });
                  },
                )),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              alignment: Alignment.centerLeft,
              width: width(context),
              child: GestureDetector(
                  onTap: () => push(context, const LoginPage()),
                  child: Container(
                    // width: width(context),
                    child: RichText(
                        text: const TextSpan(
                      style:
                          TextStyle(fontSize: 11, color: AppColors.buttonColor),
                      children: [
                        TextSpan(
                          text:
                              """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suscipit dolor amet enim sed. Eu ante elementum, aenean quis.""",
                          style: TextStyle(fontSize: 11),
                        ),
                        TextSpan(
                          text: " Sign In",
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.w700),
                        ),
                      ],
                    )),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
