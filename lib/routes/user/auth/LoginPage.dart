import "package:flutter/material.dart";
import "package:melon/routes/home/HomePage.dart";
import "package:melon/routes/user/auth/AuthPage.dart";
import 'package:melon/routes/user/auth/SignUp.dart';
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/functions.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  Object agreed = false;

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
                    margin:const EdgeInsets.only(top: 41, left: 48),
                    child: Logo())),
            Positioned(
                top: 125,
                right: 80,
                width: width(context),
                child: Container(
                    child: Column(
                  children: [
                    Container(
                      width: 135,
                      child:const Text(
                        "Sign in",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      width: 135,
                      margin:const EdgeInsets.only(top: 5),
                      child:const Text(
                        "Welcome back to Melon",
                        style:
                            TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ))),
            Positioned(
              top: 200,
              child: Container(
                  height: (height(context) / 2) + 40,
                  width: width(context) - 60,
                  child: Column(children: [
                    Container(
                      margin:const EdgeInsets.only(bottom: 5),
                      child: TextFormField(
                        decoration:const InputDecoration(
                            hintText: "Email Address",
                            hintStyle: TextStyle(fontSize: 11)),
                      ),
                    ),
                    Container(
                      margin:const EdgeInsets.only(bottom: 5),
                      child: TextFormField(
                        decoration:const InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(fontSize: 11)),
                      ),
                    ),
                    Container(
                        alignment: Alignment.bottomRight,
                        width: width(context),
                        margin:const EdgeInsets.only(bottom: 5),
                        child: TextButton(
                          style: TextButton.styleFrom(primary: AppColors.buttonColor),
                          onPressed: () {},
                          child:const Text(
                            "Forget Password?",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          ),
                        )),
                  ])),
            ),
            Positioned(
                top: 623,
                child: AppButton(
                  "Sign In",
                  onPressed: () => pushReplacement(context,const HomePage()),
                )),
            Positioned(
                top: 672,
                width: width(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("You dont have an account? ",
                      style: TextStyle(fontSize: 11),
                    ),
                    Container(width: 130,
                      child: GestureDetector(
                        onTap: ()=>push(context, const SignUpPage()),
                        child:const Text("Create Account Now",
                          style: TextStyle(fontSize: 11,fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
