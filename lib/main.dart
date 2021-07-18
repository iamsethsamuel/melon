import 'package:flutter/material.dart';
import 'package:melon/routes/welcome/WelcomePage.dart';
import 'package:melon/utils/GlobalWidgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Melon',
      color: AppColors.buttonColor,
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(primary: AppColors.buttonColor)),
        focusColor: AppColors.primaryColor,
        primaryColor: AppColors.primaryColor,
          fontFamily: "Raleway",
          iconTheme: IconThemeData(color: AppColors.primaryColor),
          hintColor: AppColors.buttonColor,
          textTheme: TextTheme(
              bodyText1: TextStyle(
                color: AppColors.buttonColor,
              ),
              bodyText2: TextStyle(color: AppColors.buttonColor),
              headline1: TextStyle(color: AppColors.buttonColor),
              headline2: TextStyle(color: AppColors.buttonColor),
              headline3: TextStyle(color: AppColors.buttonColor),
              headline4: TextStyle(color: AppColors.buttonColor),
              headline5: TextStyle(color: AppColors.buttonColor),
              headline6: TextStyle(color: AppColors.buttonColor),
              subtitle1: TextStyle(color: AppColors.buttonColor),
              subtitle2: TextStyle(color: AppColors.buttonColor),

              ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(primary: AppColors.buttonColor))),
      home: WelcomePage(),
    );
  }
}
