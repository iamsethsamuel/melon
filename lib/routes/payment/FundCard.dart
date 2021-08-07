import 'dart:convert';
import 'dart:math';

import "package:flutter/material.dart";
import 'package:melon/classes/classes.dart';
import 'package:melon/models/models.dart';
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/functions.dart";
import "package:flutter_paystack/flutter_paystack.dart";
import "package:provider/provider.dart";

class FundCard extends StatefulWidget {
  @override
  _FundCardState createState() => _FundCardState();
}

class _FundCardState extends State<FundCard> {
  final String publicKey = "pk_live_46a7fde641233a166a32ed4b80476a98d42c8d29";
  final plugin = PaystackPlugin();
  final amount = TextEditingController();

  @override
  void initState() {
    plugin.initialize(publicKey: publicKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Future<CheckoutResponse> topUp() async {
      final Charge charge = Charge()
        ..amount = int.parse(amount.text) * 100
        ..reference = Random.secure().nextInt(99999).toString()
        ..email = context.read<UserModel>().user.email
        ..putMetaData(
            "user",
            jsonEncode({
              "phone": context.read<UserModel>().user.phone,
              "email": context.read<UserModel>().user.email
            }));

      final CheckoutResponse response = await plugin.checkout(
        context,
        method: CheckoutMethod.card,
        charge: charge,
      );
      return response;
    }

    return Scaffold(
        body: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
          Container(
            width: width(context),
            child: Column(
              children: [
                header(context, "Bank Transfer"),
                Container(
                  margin: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      CustomTextField(
                        label: "Enter Amount",
                        hint: "0.00",
                        controller: amount,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 30)
                .add(const EdgeInsets.symmetric(horizontal: 30)),
            child: AppButton(
              "Next",
              onPressed: () {
                topUp().then((value) async {
                  if (value.status) {
                    activityIndicator(context);
                    await context
                        .read<WalletModel>()
                        .updateWallet(context)
                        .then((value) {
                      removeSnackBar(context);
                      final Map res = jsonDecode(value.toString()) as Map;
                      if (res["data"] != null) {
                        print(res["data"]);
                        showSnackBar(context, "Top up successful");
                        context
                            .read<WalletModel>()
                            .getWallet(res as Map<String, dynamic>);
                      } else {
                        showSnackBar(context, res["err"]);
                      }
                    }).catchError((err) {
                      showSnackBar(context, "Sorry an error occurred");
                    });
                  } else {
                    showSnackBar(context, "Top up cancelled");
                  }
                }).catchError((err) {
                  showSnackBar(context, "Sorry an error occurred");
                });
              },
            ),
          )
        ])));
  }
}
