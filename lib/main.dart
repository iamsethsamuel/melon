import "dart:convert";

import "package:flutter/material.dart";
import "package:melon/classes/classes.dart";
import "package:melon/models/models.dart";
import "package:melon/routes/home/BioMetricsPage.dart";
import "package:melon/routes/home/BusinessHomePage.dart";
import "package:melon/routes/home/HomePage.dart";
import "package:melon/routes/user/auth/LoginPage.dart";
import 'package:melon/routes/welcome/WelcomePage.dart';
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/functions.dart";
import "package:provider/provider.dart";
import "package:flutter_secure_storage/flutter_secure_storage.dart";

const storage = FlutterSecureStorage();
//localhost
// const String url = "http://10.42.0.1:8080";
//work
// const String url = "http://192.168.0.107:8080";
//jets
// const  String url = "http://192.168.88.175:8080";
//production
const String url = "https://melonserver.herokuapp.com";

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BiometricsModel()),
        ChangeNotifierProvider(create: (_) => UserModel()),
        ChangeNotifierProvider(create: (_) => WalletModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Map? data;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.wait([context.read<UserModel>().getSessionID()]),
        builder: (context, snapshot) {
          return MaterialApp(
              title: "Melon",
              color: AppColors.buttonColor,
              theme: ThemeData(
                  textButtonTheme: TextButtonThemeData(
                      style:
                          TextButton.styleFrom(primary: AppColors.buttonColor)),
                  focusColor: AppColors.primaryColor,
                  primaryColor: AppColors.primaryColor,
                  fontFamily: "Raleway",
                  iconTheme: const IconThemeData(color: AppColors.primaryColor),
                  hintColor: AppColors.buttonColor,
                  scaffoldBackgroundColor: Colors.white,
                  snackBarTheme: const SnackBarThemeData(
                      backgroundColor: Colors.white,
                      contentTextStyle: TextStyle(color: Colors.white)),
                  inputDecorationTheme: const InputDecorationTheme(
                      fillColor: AppColors.fadedPrimary, filled: true),
                  textTheme: const TextTheme(
                    bodyText1: TextStyle(
                      color: AppColors.buttonColor,
                    ),
                    bodyText2: TextStyle(
                        color: AppColors.buttonColor,
                        fontWeight: FontWeight.w400),
                    headline1: TextStyle(
                        color: AppColors.buttonColor,
                        fontWeight: FontWeight.w400),
                    headline2: TextStyle(
                        color: AppColors.buttonColor,
                        fontWeight: FontWeight.w400),
                    headline3: TextStyle(
                        color: AppColors.buttonColor,
                        fontWeight: FontWeight.w400),
                    headline4: TextStyle(
                        color: AppColors.buttonColor,
                        fontWeight: FontWeight.w400),
                    headline5: TextStyle(
                        color: AppColors.buttonColor,
                        fontWeight: FontWeight.w400),
                    headline6: TextStyle(
                        color: AppColors.buttonColor,
                        fontWeight: FontWeight.w400),
                    subtitle1: TextStyle(
                        color: AppColors.buttonColor,
                        fontWeight: FontWeight.w400),
                    subtitle2: TextStyle(
                        color: AppColors.buttonColor,
                        fontWeight: FontWeight.w400),
                  ),
                  elevatedButtonTheme: ElevatedButtonThemeData(
                      style: ElevatedButton.styleFrom(
                          primary: AppColors.buttonColor))),
              routes: {"/biometric": (_) => const BioMetrics()},
              home: data != null
                  ? IndexPage(
                      data: data!,
                      first: false,
                    )
                  : FutureBuilder(
                      future: getRequest(context, "/user", futureBuilder: true),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done &&
                            snapshot.hasData) {
                          final Map<String, dynamic> res =
                              jsonDecode(snapshot.data.toString())
                                  as Map<String, dynamic>;
                          data = res;
                          return IndexPage(data: res, first: true);
                        } else if (snapshot.hasError) {
                          return ErrorPage(
                            page: MyApp(),
                            message: "Sorry an error occurred",
                          );
                        } else {
                          return const Scaffold(
                            body: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                      }));
        });
  }
}

class IndexPage extends StatelessWidget {
  const IndexPage({required this.data, required this.first});
  final Map data;
  final bool first;

  @override
  Widget build(BuildContext context) {
    if (data["data"] == null) {
      if (first) {
        return WelcomePage();
      } else {
        return const LoginPage();
      }
    }

    context
        .read<UserModel>()
        .login(data["data"]["user"] as Map<String, dynamic>, notify: false);
    if (first) {
      context.read<WalletModel>().getWallet(
          data["data"]["wallet"] as Map<String, dynamic>,
          notify: false);
    }
    final User user = context.read<UserModel>().user;
    if (user.accountType == "null" || user.accountType == "Personal") {
      return const HomePage();
    } else {
      return const BusinessHomePage();
    }
  }
}
