import "dart:convert";

import "package:flutter/material.dart";
import "package:melon/main.dart";
import "package:melon/routes/home/HomePage.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/functions.dart";
import "package:provider/provider.dart";
import "package:melon/models/models.dart";

class VerificationPage extends StatefulWidget {
  const VerificationPage(
      {Key? key,
      this.message,
      this.redirectionPage,
      this.title,
      this.header,
      this.trailing,
      this.user,
      this.callback,
      this.phone})
      : super(key: key);
  final Widget? redirectionPage;
  final String? message;
  final Widget? header;
  final Widget? title;
  final Widget? trailing;
  final Map<String, String>? user;
  final Function? callback;
  final String? phone;

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
      body: SafeArea(child:
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    widget.title ??
                        Container(
                            alignment: Alignment.centerLeft,
                            width: width(context),
                            height: 27.96,
                            margin: const EdgeInsets.only(
                                top: 41, left: 30, bottom: 30),
                            child: const Logo(
                              logowidth: 90,
                            )),
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
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Container(
                                width: 175,
                                margin:
                                    const EdgeInsets.only(top: 5, bottom: 30),
                                child: const Text(
                                  "OTP Code Send to your Phone Number",
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            ],
                          )),
                    Container(
                        margin: const EdgeInsets.only(top: 20),
                        width: width(context),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 30),
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
                                          borderSide: const BorderSide(
                                              color: AppColors.buttonColor,
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(12))),
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
                      margin: const EdgeInsets.symmetric(vertical: 100),
                      width: width(context),
                      child: const Icon(
                        Icons.fingerprint,
                        size: 66,
                      )),
                Container(
                    margin: const EdgeInsets.only(
                        top: 70, bottom: 50, left: 30, right: 30),
                    child: AppButton(widget.message ?? "Complete Now",
                        onPressed: () {
                      activityIndicator(context);
                      final String code = controllers.map((e) => e.text).join();

                      if (widget.message != null) {
                        postRequest(context, "/confirmnumber", {
                          "phone": widget.phone,
                          "code": code
                        }).then((value) async {
                          final Map<String, dynamic> res =
                              jsonDecode(value.data.toString())
                                  as Map<String, dynamic>;
                          if (res["data"] != null) {
                            widget.callback!();
                          } else {
                            showSnackBar(context, res["err"],
                                color: Colors.red);
                          }
                        });
                        return;
                      }

                      if (widget.user != null) {
                        postRequest(context, "/confirmnumber", {
                          "phone": widget.user!["phone"],
                          "code": code
                        }).then((value) async {
                          final Map<String, dynamic> res =
                              jsonDecode(value.data.toString())
                                  as Map<String, dynamic>;
                          if (res["data"] != null) {
                            await postRequest(context, "/signup", widget.user!)
                                .then((value) async {
                              removeSnackBar(context);
                              final Map<String, dynamic> res =
                                  jsonDecode(value.data.toString())
                                      as Map<String, dynamic>;
                              ScaffoldMessenger.of(context)
                                  .removeCurrentSnackBar();
                              if (res["data"] != null) {
                                final Map<String, dynamic> data =
                                    res["data"] as Map<String, dynamic>;

                                await storage.write(
                                    key: "user",
                                    value: jsonEncode(data["user"]));
                                context.read<WalletModel>().getWallet(
                                    data["wallet"] as Map<String, dynamic>);
                                context
                                    .read<UserModel>()
                                    .login(data["user"] as Map<String, dynamic>)
                                    .then((value) {
                                  pushReplacement(context, MyApp());
                                  removeSnackBar(context);
                                });
                              } else {
                                showSnackBar(context, res["err"],
                                    color: Colors.red);
                              }
                            }).catchError((err) {
                              print(err);
                              showSnackBar(context, "Sorry an error occurred");
                            });
                          } else {
                            showSnackBar(context, res["err"]);
                          }
                        }).catchError((err) {
                          showSnackBar(context,
                              "An error occurred while sending OTP. Try again");
                        });
                      } else {
                        pop(context);
                      }
                    })),
              ],
            ),
      ),
    );
  }
}
