import "package:flutter/material.dart";
import "package:melon/routes/home/HomePage.dart";
import "package:melon/routes/user/auth/SignUp.dart";
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
      body: SafeArea(
        child: Container(
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
                    Container(
                        width: 100,
                        child:const  Logo(
                          logowidth: 90,
                        )),
                    Container(
                        padding: const EdgeInsets.only(left: 30, top: 20),
                        margin: const EdgeInsets.only(bottom: 30),
                        child: Column(
                          children: [
                            Container(
                              width: 135,
                              child: const Text(
                                "Sign in",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                            ),
                            Container(
                              width: 135,
                              margin: const EdgeInsets.only(top: 5),
                              child: const Text(
                                "Welcome back to Melon",
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
                  height: (height(context) / 2) + 40,
                  width: width(context) - 60,
                  margin: const EdgeInsets.only(top: 30),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(children: [
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
                            filled: false,
                            hintText: "Password",
                            hintStyle: TextStyle(fontSize: 11)),
                      ),
                    ),
                    Container(
                        alignment: Alignment.bottomRight,
                        width: width(context),
                        margin: const EdgeInsets.only(bottom: 5),
                        child: TextButton(
                          style: TextButton.styleFrom(
                              primary: AppColors.buttonColor),
                          onPressed: () {},
                          child: const Text(
                            "Forget Password?",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          ),
                        )),
                  ])),
              Container(
                margin: const EdgeInsets.only(bottom: 10)
                    .add(const EdgeInsets.symmetric(horizontal: 30)),
                child: AppButton(
                  "Sign In",
                  onPressed: () => pushReplacement(context, const HomePage()),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10)
                    .add(const EdgeInsets.symmetric(horizontal: 30)),
                width: width(context),
                alignment: Alignment.bottomLeft,
                child: GestureDetector(
                    onTap: () => push(context, const SignUpPage()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "You dont have an account? ",
                          style: TextStyle(fontSize: 11),
                        ),
                        Container(
                          width: 130,
                          child: const Text(
                            "Create Account Now",
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
