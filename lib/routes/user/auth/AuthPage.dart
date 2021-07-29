
import "package:flutter/material.dart";
import "package:melon/routes/user/auth/LoginPage.dart";
import "package:melon/routes/user/auth/SignUp.dart";
import "package:melon/routes/user/auth/VerificationPage.dart";

class AuthPage extends StatelessWidget {
 const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        // ignore: prefer_const_literals_to_create_immutables
        children:<Widget> [const SignUpPage(), const VerificationPage(), const LoginPage(),],
      ),
    );
  }
}
