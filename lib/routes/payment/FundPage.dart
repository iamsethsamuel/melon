import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:melon/routes/payment/FundBank.dart";
import "package:melon/routes/payment/FundCard.dart";
import "package:melon/utils/GlobalWidgets.dart";

class FundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            header(context, "Fund"),
            Container(
              margin:const  EdgeInsets.only(top: 50),
              child: MenuButton(
                  header: "Bank Transfer",
                  description: "From other bank app or internet banking",
                  icon: Icons.compare_arrows_rounded,
                  route: FundBank()),
            ),
            MenuButton(
                header: "Card",
                description: "Add Money with your debit card",
                icon: Icons.credit_card,
                route: FundCard()),
          ],
        ),
      ],
    ),);
  }
}
