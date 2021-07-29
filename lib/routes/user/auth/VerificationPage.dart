import "package:flutter/material.dart";
import "package:melon/routes/home/HomePage.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/functions.dart";

class VerificationPage extends StatefulWidget {
  const VerificationPage(
      {Key? key,
      this.message,
      this.redirectionPage,
      this.title,
      this.header,
      this.trailing})
      : super(key: key);
  final Widget? redirectionPage;
  final String? message;
  final Widget? header;
  final Widget? title;
  final Widget? trailing;
  @override
  VerificationPageState createState() => VerificationPageState();
}

class VerificationPageState extends State<VerificationPage> {
  Object agreed = false;
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
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                widget.title ??
                    Container(
                      alignment: Alignment.centerLeft,
                        width: width(context),
                        height: 27.96,
                        margin: const EdgeInsets.only(top: 41, left: 30,bottom: 30),
                        child: const Logo(logowidth: 90,)),
                widget.header ?? Container(),
                if (widget.message == null)
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          Container(
                            child: const Text(
                              "Verify Phone Number",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                          ),
                          Container(
                            width: 175,
                            margin: const EdgeInsets.only(top: 5,bottom: 30),
                            child: const Text(
                              "OTP Code Send to your Phone Number",
                              style: TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      )),
                      Container(
                margin:const EdgeInsets.only(top: 20),
                width: width(context),
                alignment: Alignment.center,
                padding:const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: <Widget>[
                    for (int i = 0; i < 4; i++)
                      Container(
                        width: 75,
                        height: 70,
                        padding: const EdgeInsets.only(right: 10),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              fillColor: Colors.transparent,
                              border: OutlineInputBorder(
                                  borderSide:const BorderSide(
                                      color: AppColors.buttonColor, width: 2),
                                  borderRadius: BorderRadius.circular(12))),
                          controller: controllers[i],
                          focusNode: focusNodes[i],
                          onChanged: (_) {
                            focusNodes[i].nextFocus();
                          },
                        ),
                      )
                  ],
                )),
            if (widget.message != null) widget.trailing ?? Container(),
            
              ],
            ),
            if (widget.message != null)
              Container(
                  margin:const EdgeInsets.symmetric(vertical: 100),
                  width: width(context),
                  child:const Icon(
                    Icons.fingerprint,
                    size: 66,
                  )),
            Container(
                margin:const EdgeInsets.only(top: 70, bottom: 50, left: 30, right: 30),
                child: AppButton(widget.message ?? "Complete Now",
                    onPressed: () {
                  push(context, widget.redirectionPage ??const HomePage());
                })),
          ],
        ),
      ),
    );
  }
}
