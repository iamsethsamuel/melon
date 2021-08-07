import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import 'package:melon/routes/payment/QRCodePage.dart';
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/functions.dart";

class GenerateQRCode extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            header(context, "Input Amount"),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 30)
                    .add(const EdgeInsets.only(top: 60)),
                child: CustomTextField(
                  controller: controller,
                  textInputType: TextInputType.number,
                  label: "Enter Amount",
                )),
          ],
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 30)
                .add(const EdgeInsets.only(bottom: 30)),
            child: AppButton("Generate QR Code", onPressed: () {
              push(context, QRCodePage(amount: int.tryParse(controller.text),));
            }))
      ],
    ));
  }
}
