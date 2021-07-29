import "package:flutter/material.dart";
import "package:melon/models/models.dart";
import "package:melon/routes/home/BioMetricsPage.dart";
import "package:melon/routes/home/BusinessHomePage.dart";
import "package:melon/routes/home/HomePage.dart";
import "package:melon/routes/welcome/WelcomePage.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:provider/provider.dart";

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BiometricsModel()),
        ChangeNotifierProvider(create: (_) => UserModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Melon",
        color: AppColors.buttonColor,
        theme: ThemeData(
            textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(primary: AppColors.buttonColor)),
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
                  color: AppColors.buttonColor, fontWeight: FontWeight.w400),
              headline1: TextStyle(
                  color: AppColors.buttonColor, fontWeight: FontWeight.w400),
              headline2: TextStyle(
                  color: AppColors.buttonColor, fontWeight: FontWeight.w400),
              headline3: TextStyle(
                  color: AppColors.buttonColor, fontWeight: FontWeight.w400),
              headline4: TextStyle(
                  color: AppColors.buttonColor, fontWeight: FontWeight.w400),
              headline5: TextStyle(
                  color: AppColors.buttonColor, fontWeight: FontWeight.w400),
              headline6: TextStyle(
                  color: AppColors.buttonColor, fontWeight: FontWeight.w400),
              subtitle1: TextStyle(
                  color: AppColors.buttonColor, fontWeight: FontWeight.w400),
              subtitle2: TextStyle(
                  color: AppColors.buttonColor, fontWeight: FontWeight.w400),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style:
                    ElevatedButton.styleFrom(primary: AppColors.buttonColor))),
        routes: {"/biometric": (_) => const BioMetrics()},
        home: Consumer<UserModel>(
          builder: (context, user, child) {
            if (user.user.phone != null) {
              return WelcomePage();
            } else if (user.user.accountType == "Personal") {
              return const HomePage();
            } else {
              return const BusinessHomePage();
            }
          },
        ));
  }
}
