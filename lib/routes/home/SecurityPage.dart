import "package:flutter/material.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/functions.dart";

class SecurityPage extends StatefulWidget {
  const SecurityPage({Key? key, this.action}) : super(key: key);
  final Future<void> Function()? action;
  @override
  SecurityPageState createState() => SecurityPageState();
}

class SecurityPageState extends State<SecurityPage> {
  List<TextEditingController> controllers = <TextEditingController>[
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  List<FocusNode> focusNodes = <FocusNode>[
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode()
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: height(context) / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: width(context),
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 50),
            child: const Text(
              "Input Pin",
              style: TextStyle(
                  color: AppColors.buttonColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Center(
                child: Row(
                  children: <Widget>[
                    for (int i = 0; i < 4; i++)
                      Container(
                        width: 60,
                        height: 60,
                        padding: const EdgeInsets.only(right: 10),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColors.buttonColor, width: 2),
                                  borderRadius: BorderRadius.circular(12)),
                              focusColor: AppColors.fadedPrimary,
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColors.buttonColor, width: 10),
                                  borderRadius: BorderRadius.circular(12))),
                          controller: controllers[i],
                          focusNode: focusNodes[i],
                          onChanged: (_) {
                            focusNodes[i].nextFocus();
                          },
                        ),
                      )
                  ],
                ),
              )),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 40),
              width: width(context),
              child: const Icon(
                Icons.fingerprint,
                size: 66,
              )),
          AppButton("Send", onPressed: () {
            if (widget.action != null) {
              removeSnackBar(context);
              widget.action!();
            } else {
              removeSnackBar(context);
            }
          })
        ],
      ),
    );
  }
}
