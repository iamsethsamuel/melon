import "dart:convert";
import "dart:io";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:melon/models/models.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/functions.dart";
import "package:provider/provider.dart";
import "package:qr_flutter/qr_flutter.dart";
import "package:screenshot/screenshot.dart";
import "package:path_provider/path_provider.dart";
import "package:share/share.dart";

class QRCodePage extends StatelessWidget {
  QRCodePage({Key? key, required this.amount}) : super(key: key);
  final int? amount;
  final ScreenshotController screenshotController = ScreenshotController();

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
          child: Screenshot(
            controller: screenshotController,
            child: Container(
              padding: const EdgeInsets.all(10),
              color: AppColors.fadedPrimary,
              child: SizedBox(
                height: 290,
                width: 290,
                child: QrImage(
                  data: jsonEncode({
                    "id": context.read<UserModel>().user.id!,
                    "amount": amount,
                    "name": context.read<UserModel>().user.name,
                    "pic": context.read<UserModel>().user.pic
                  }),
                  embeddedImage: const AssetImage("assets/images/o_filled.png"),
                  foregroundColor: AppColors.buttonColor,
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 30),
          width: width(context),
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () async {
              await screenshotController
                  .capture(delay: const Duration(milliseconds: 10))
                  .then((image) async {
                final dir = await getApplicationDocumentsDirectory();
                final imgpath = await File(
                        "${dir.path}/MelonQRCode_${DateTime.now().toUtc().toString()}.png")
                    .create();
                await imgpath.writeAsBytes(image!);
                await Share.shareFiles([imgpath.path]);
              });
            },
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
