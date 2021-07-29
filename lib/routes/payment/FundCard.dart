import "package:flutter/material.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/functions.dart";

class FundCard extends StatefulWidget {
  @override
  _FundCardState createState() => _FundCardState();
}

class _FundCardState extends State<FundCard> {
  @override
  Widget build(BuildContext context) {
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
                    children: const [
                      CustomTextField(
                        label: "Enter Amount",
                        hint: "0.00",
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
              onPressed: () {},
            ),
          )
        ])));
  }
}
