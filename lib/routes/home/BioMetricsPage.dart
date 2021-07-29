import "package:flutter/services.dart";
import "package:flutter/material.dart";
import "package:melon/models/models.dart";
import "package:melon/routes/home/SecurityPage.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/functions.dart";
import "package:local_auth/local_auth.dart";
import "package:provider/provider.dart";

class BioMetrics extends StatefulWidget {
  const BioMetrics({Key? key}) : super(key: key);
  @override
  BioMetricsState createState() => BioMetricsState();
}

class BioMetricsState extends State<BioMetrics> {
  bool switchValue = false;
  LocalAuthentication localAuth = LocalAuthentication();
  final LocalAuthentication auth = LocalAuthentication();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      setState(() {});
      authenticated = await auth.authenticate(
          localizedReason: "Scan your fingerprint or face  to authenticate",
          stickyAuth: true,
          biometricOnly: true);
      setState(() {});
    } on PlatformException catch (e) {
      print(e);
      setState(() {});
      return;
    }
    if (!mounted) return;
    context.read<BiometricsModel>().state = authenticated;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          header(context, "Biometrics"),
          Center(
            child: Container(
                width: 300,
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Icon(
                      Icons.fingerprint,
                      color: AppColors.primaryColor,
                      size: 83,
                    ),
                    Container(
                      child: Switch(
                          activeColor: AppColors.primaryColor,
                          inactiveThumbColor: AppColors.fadedPrimary,
                          value: context.read<BiometricsModel>().enabled,
                          onChanged: (bool value) {
                            if (value) {
                              showSnackBar(
                                  context,
                                  SecurityPage(
                                      action: _authenticateWithBiometrics),
                                  duration: const Duration(days: 1));
                            } else {
                              setState(() {
                                switchValue = false;
                              });
                            }
                          }),
                    )
                  ],
                )),
          ),
          Container(
              margin: const EdgeInsets.only(bottom: 40, top: 380)
                  .add(const EdgeInsets.symmetric(horizontal: 30)),
              child: AppButton("Close", onPressed: () => pop(context)))
        ],
      )),
    );
  }
}
