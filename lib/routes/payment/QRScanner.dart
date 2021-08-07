import "dart:io";
import "package:melon/routes/payment/PaymentPage.dart";
import "package:qr_code_scanner/qr_code_scanner.dart";
import "package:flutter/material.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/functions.dart";

class QRScanner extends StatefulWidget {
  const QRScanner({Key? key}) : super(key: key);
  @override
  QRScannerState createState() => QRScannerState();
}

class QRScannerState extends State<QRScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: "QR");
  Barcode? result;
  QRViewController? controller;
  String url = "";

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (scanData.code.isNotEmpty) {
        controller.stopCamera();
        controller.dispose();
        push(context, PaymentPage(code: scanData.code));
      } else {
        showSnackBar(context, "Try again");
      }
    });
  }

  @override
  void dispose() {
    if (Platform.isAndroid) {
      controller!.dispose();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF818F92),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              width: width(context),
              height: 25,
              margin: const EdgeInsets.only(top: 29, left: 30, bottom: 10),
              child: const Logo(
                logowidth: 77.21,
              ),
            ),
            Container(
              height: 303,
              width: 300,
              margin: const EdgeInsets.only(top: 55),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
              ),
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text(
                    "Point your camera towards a",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                const Text(
                  "QR Code",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
