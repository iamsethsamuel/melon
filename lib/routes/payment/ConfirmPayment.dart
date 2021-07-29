import "package:flutter/material.dart";
import "package:melon/routes/home/SecurityPage.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/functions.dart";

class ConfirmPayment extends StatelessWidget {
  const ConfirmPayment({Key? key, required this.amount, required this.user})
      : super(key: key);
  final String amount, user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context),
      height: (height(context) / 2) + 72,
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
                  child: const Text(
                    "#1,000,000.00",
                    textAlign: TextAlign.center,
                    style: TextStyle(
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
                        user,
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
                        "# $amount",
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
                      child: const Text(
                        "Susan Huil",
                        textAlign: TextAlign.center,
                        style: TextStyle(
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
                showSnackBar(context, const SecurityPage(),
                    duration: const Duration(days: 1));
              }))
        ],
      ),
    );
  }
}
