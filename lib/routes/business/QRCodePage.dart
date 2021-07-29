import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:melon/models/models.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/functions.dart";
import "package:provider/provider.dart";

class QRCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        header(context, ""),
        Container(
          alignment: Alignment.center,
          width: width(context),
          child: Text(
            context.read<UserModel>().user.name!,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: const Icon(
            Icons.qr_code_2_rounded,
            size: 300,
            color: AppColors.buttonColor,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 30),
          width: width(context),
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Share QR Code  ",
                  style: TextStyle(fontSize: 16),
                ),
                Icon(
                  Icons.share,
                  color: AppColors.buttonColor,
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
