import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/functions.dart";

class UploadDocuments extends StatefulWidget {
  const UploadDocuments({Key? key}) : super(key: key);
  @override
  UploadDocumentsState createState() => UploadDocumentsState();
}

class UploadDocumentsState extends State<UploadDocuments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            header(context, "Upload Document"),
            Container(
              width: width(context),
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.all(10)
                  .add(const EdgeInsets.symmetric(horizontal: 30)),
              child: Column(
                children: <Widget>[
                  Container(
                    width: width(context),
                    child: const Text(
                      "Upload ID Document",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    width: width(context),
                    child: const Text(
                      "Please take a picture of legal dicument confirming this change in your name.",
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                  Container(
                    width: width(context),
                      margin: const EdgeInsets.only(top: 50),
                      child: Column(children: [
                        CustomTextField(
                          label: "DSC_12332.png",
                          suffix: TextButton(
                              onPressed: () {},
                              child: Container(
                                width: 60,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const <Widget>[
                                    Text(
                                      "Upload",
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Icon(Icons.cloud_upload)
                                  ],
                                ),
                              )),
                        )
                      ]))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 340, bottom: 30)
                  .add(const EdgeInsets.symmetric(horizontal: 30)),
              child: AppButton(
                "Complete",
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
