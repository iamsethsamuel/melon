import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

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

void showSnackBar(BuildContext context, dynamic widget, {Duration? duration}) {
  removeSnackBar(context);
  if (widget.runtimeType == String) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(widget as String),
      duration: duration ??const  Duration(seconds: 10),
    ));
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: widget as Widget,
      duration: duration ??const  Duration(seconds: 10),
    ));
  }
}

void removeSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
}
