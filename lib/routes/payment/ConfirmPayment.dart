import 'dart:convert';

import "package:flutter/material.dart";
import 'package:melon/classes/classes.dart';
import 'package:melon/models/models.dart';
import "package:melon/routes/home/SecurityPage.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/functions.dart";
import "package:provider/provider.dart";

class ConfirmPayment extends StatelessWidget {
  const ConfirmPayment({Key? key, required this.data, this.widgetcontext})
      : super(key: key);
  final Map data;
  final BuildContext? widgetcontext;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context),
      height: (height(context) / 2) + 100,
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 27),
            child: const Text(
              "Payment Details",
              style: TextStyle(
                  color: AppColors.buttonColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            width: width(context),
            margin: const EdgeInsets.only(top: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: width(context),
                  child: Text(
                    (context.read<WalletModel>().wallet.balance! -
                            int.parse(data["amount"].toString()))
                        .toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      color: AppColors.buttonColor,
                    ),
                  ),
                ),
                Container(
                    width: width(context),
                    child: const Text(
                      "Balance",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.buttonColor,
                      ),
                    ))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(30)
                .add(const EdgeInsets.symmetric(horizontal: 15)),
            margin: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const Text(
                      "To ",
                      style: TextStyle(
                        color: AppColors.buttonColor,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      color: AppColors.fadedPrimary,
                      child: Text(
                        data["name"].toString(),
                        style: const TextStyle(
                            fontSize: 16, color: AppColors.buttonColor),
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    const Text(
                      "Amount",
                      style: TextStyle(
                        color: AppColors.buttonColor,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      color: AppColors.fadedPrimary,
                      child: Text(
                        "# ${data["amount"]}",
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.buttonColor,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 310,
                padding: const EdgeInsets.all(20),
                color: AppColors.fadedPrimary,
                child: Column(
                  children: [
                    Container(
                      width: width(context),
                      child: const Text(
                        "From",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.buttonColor,
                        ),
                      ),
                    ),
                    Container(
                      width: width(context),
                      child: Text(
                        context.read<UserModel>().user.name.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 21,
                          color: AppColors.buttonColor,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: const Text(
                              "Transaction Fee ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.buttonColor,
                              ),
                            ),
                          ),
                          Container(
                            child: const Text(
                              "10.00",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.buttonColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
              margin: const EdgeInsets.only(top: 40),
              child: AppButton("Make Payment", onPressed: () {
                showSnackBar(widgetcontext!, SecurityPage(
                  action: () {
                    activityIndicator(widgetcontext!);
                    postRequest(widgetcontext!, "/sendmoney", data)
                        .then((value) {
                      final Map res = jsonDecode(value.data.toString()) as Map;
                      if (res["data"] != null) {
                        showSnackBar(widgetcontext!, "Payment successful");
                        widgetcontext!
                            .read<WalletModel>()
                            .getWallet(res["data"] as Map<String, dynamic>);
                      } else {
                        showSnackBar(widgetcontext!, res["err"]);
                      }
                    }).catchError((err) {
                      print(err);
                      showSnackBar(widgetcontext!, "Sorry an error occurred");
                    });
                  },
                ), duration: const Duration(days: 1));
              }))
        ],
      ),
    );
  }
}
