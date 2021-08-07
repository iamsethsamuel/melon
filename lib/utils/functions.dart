import 'dart:convert';

import 'package:dio/dio.dart';
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import 'package:melon/main.dart';
import 'package:melon/models/models.dart';
import 'package:melon/utils/GlobalWidgets.dart';
import "package:provider/provider.dart";

Dio dio = Dio();

double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double percentage(double percent, double size) {
  return (percent / 100) * size;
}

void push(BuildContext context, Widget page) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (BuildContext context) => page));
}

void pushNamed(BuildContext context, String page) {
  Navigator.of(context).pushNamed(page);
}

void pushReplacement(BuildContext context, Widget page) {
  Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (BuildContext context) => page));
}

void pop(BuildContext context) {
  Navigator.pop(context);
}

void showSnackBar(BuildContext context, dynamic widget,
    {Duration? duration, Color? color}) {
  removeSnackBar(context);
  if (widget.runtimeType == String) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        widget as String,
        style: TextStyle(color: color ?? AppColors.buttonColor),
      ),
      duration: duration ?? const Duration(seconds: 10),
    ));
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: widget as Widget,
      duration: duration ?? const Duration(seconds: 10),
    ));
  }
}

void removeSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
}

Future getRequest(BuildContext context, String path,
    {bool? futureBuilder}) async {
  return dio.get(url + path,
      options: Options(
          headers: {"Authorization": context.read<UserModel>().sessionId}));
}

Future postRequest(BuildContext context, String path, Map data) async {
  return dio
      .post(url + path,
          data: jsonEncode(data),
          options: Options(headers: {
            "Authorization": context.read<UserModel>().sessionId,
            "Content-Type": "application/json"
          }));
}

void activityIndicator(BuildContext context) {
  showSnackBar(context, const LinearProgressIndicator(),
      duration: const Duration(days: 1));
}
