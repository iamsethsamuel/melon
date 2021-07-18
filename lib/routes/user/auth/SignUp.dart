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
                      child:const Text(
                        "Create an Account",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      width: 135,
                      margin:const EdgeInsets.only(top: 5),
                      child:const Text(
                        "It only takes few seconds",
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
                  child: Column(
                    children: [
                      Container(
                        margin:const EdgeInsets.only(bottom: 5),
                        child: TextFormField(
                          decoration:const InputDecoration(
                              hintText: "First Name",
                              hintStyle: TextStyle(fontSize: 11)),
                        ),
                      ),
                      Container(
                        margin:const EdgeInsets.only(bottom: 5),
                        child: TextFormField(
                          decoration:const InputDecoration(
                              hintText: "Last Name",
                              hintStyle: TextStyle(fontSize: 11)),
                        ),
                      ),
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
                              hintText: "Phone Number",
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
                        margin:const EdgeInsets.only(bottom: 5),
                        child: TextFormField(
                          decoration:const InputDecoration(
                              hintText: "Re-type Password",
                              hintStyle: TextStyle(fontSize: 11)),
                        ),
                      ),
                      Container(
                          margin:const EdgeInsets.only(bottom: 5),
                          height: 60,
                          child: Row(
                            children: [
                              MaterialRadio(
                                color: AppColors.primaryColor,
                                size: 18,
                              ),
                              Container(
                                margin:const EdgeInsets.only(left: 10),
                                width: width(context) - 95,
                                height: 12,
                                child: Row(
                                  children:const <Widget> [
                                    Text("I have read the ",
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
                )),
            Positioned(
                top: 623,
                child: AppButton(
                  "Create Account",
                  onPressed: () {},
                )),
                Positioned(
                top: 692,
                width: width(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("""
                  Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                  Suscipit dolor amet enim sed. Eu ante elementum, aenean quis.  
                  """,
                      style: TextStyle(fontSize: 8),
                    ),
                    Container(width: 50,
                      child: GestureDetector(
                        onTap: ()=>push(context, const LoginPage()),
                        child:const Text("Sign In",
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
