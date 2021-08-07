import 'dart:convert';

import "package:flutter/material.dart";
import 'package:melon/models/models.dart';
import "package:melon/utils/GlobalWidgets.dart";
import 'package:melon/utils/data.dart';
import "package:melon/utils/functions.dart";
import "package:provider/provider.dart";

class ChangeAddress extends StatefulWidget {
  const ChangeAddress({Key? key}) : super(key: key);
  @override
  ChangeAddressState createState() => ChangeAddressState();
}

class ChangeAddressState extends State<ChangeAddress> {
  final street = TextEditingController(),
      city = TextEditingController(),
      state = TextEditingController(),
      country = TextEditingController(text: "Nigeria");
  bool firstBuild = true;
  @override
  Widget build(BuildContext context) {
        if (firstBuild) {
      city.text = context.read<UserModel>().user.city.toString();
      state.text = context.read<UserModel>().user.state.toString();
      street.text = context.read<UserModel>().user.street.toString();
      firstBuild = false;
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            header(context, "Address"),
            Container(
              width: width(context),
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: <Widget>[
                  Container(
                    width: width(context),
                    child: const Text(
                      "Change your address",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    width: width(context),
                    child: const Text(
                      "Please enter your new resodential address",
                      style: TextStyle(fontSize: 11),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(30),
              child: Column(
                children: <Widget>[
                  CustomTextField(
                    label: "Street",
                    controller: street,
                  ),
                  CustomTextField(
                    label: "City",
                    controller: city,
                  ),
                  CustomTextField(
                    label: "State",
                    controller: state,
                    readOnly: true,
                    onTap: () {
                      showSnackBar(
                          context,
                          Container(
                            width: width(context),
                            height: height(context) / 3,
                            child: ListView.builder(
                                itemCount: states.length,
                                itemBuilder: (_, index) {
                                  return TextButton(
                                    onPressed: () {
                                      state.text = states[index];
                                      removeSnackBar(context);
                                    },
                                    child: Text(
                                      states[index],
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  );
                                }),
                          ),
                          duration: const Duration(days: 1));
                    },
                  ),
                  CustomTextField(
                    label: "Country",
                    readOnly: true,
                    controller: country,
                    suffix: TextButton(
                        style: TextButton.styleFrom(
                            primary: AppColors.primaryColor),
                        onPressed: () {},
                        child: Container(
                            width: 10,
                            child: const RotatedBox(
                              quarterTurns: 3,
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                color: AppColors.primaryColor,
                              ),
                            ))),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 100)
                  .add(const EdgeInsets.symmetric(horizontal: 30)),
              child: AppButton(
                "Complete",
                onPressed: () {
                  activityIndicator(context);
                  postRequest(context, "/updateuser", {
                    "street": street.text,
                    "city": city.text,
                    "state": state.text,
                    "country": country.text,
                    "type": "address",
                  }).then((value) {
                    final Map res = jsonDecode(value.data.toString()) as Map;
                    if (res["data"] != null) {
                      context.read<UserModel>().login(
                            res["data"] as Map<String, dynamic>,
                          );
                      showSnackBar(context, "Address updated successfully");
                    } else {
                      showSnackBar(context, res["err"]);
                    }
                  }).catchError((err) {
                    print(err);
                    showSnackBar(context, "Sorry an error occurred");
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
