import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:melon/routes/business/GenerateQRCode.dart";
import "package:melon/routes/payment/AirtimePurchase.dart";
import "package:melon/routes/payment/BankTransfer.dart";
import "package:melon/routes/payment/PayBills.dart";
import "package:melon/utils/GlobalWidgets.dart";

class MenuPaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            header(context, "Payment"),
            Container(
              margin:const  EdgeInsets.only(top: 50),
              child: MenuButton(
                  header: "QR Code",
                  icon: Icons.qr_code_scanner_rounded,
                  description: "Generate your QR Code Payment",
                  route: GenerateQRCode()),
            ),
            MenuButton(
                header: "Transfer",
                icon: Icons.compare_arrows_rounded,
                description: "Send Money to Banks",
                route: BankTransfer()),
            MenuButton(
                header: "Buy Airtime",
                icon: Icons.phone_android,
                description: "Recharge any network easily",
                route: AirtimePurchase()),
            MenuButton(
                header: "Pay Bills",
                icon: Icons.payment,
                description: "Pay your bills easily",
                route: PayBills())
          ],
        ),
      ],
    ));
  }
}
