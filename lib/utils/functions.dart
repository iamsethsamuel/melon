import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
}

void pushReplacement(BuildContext context, Widget page) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => page));
}