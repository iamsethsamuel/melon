import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:melon/routes/payment/AirtimePurchase.dart";
import "package:melon/routes/payment/PayTV.dart";
import "package:melon/utils/GlobalWidgets.dart";

class PayBills extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            header(context, "Bill"),
            Container(
              margin:const  EdgeInsets.only(top: 50),
              child: MenuButton(
                  header: "TV",
                  icon: Icons.tv_rounded,
                  route: PayTV()),
            ),
            MenuButton(
                header: "Internet",
                icon: Icons.wifi,
                route: AirtimePurchase()),
            MenuButton(
                header: "Electricity",
                icon: Icons.electrical_services_outlined,
                route: Container()),
            MenuButton(
                header: "Betting",
                icon: Icons.casino_rounded,
                route: Container())
          ],
        ),
      ],
    ),);
  }
}
