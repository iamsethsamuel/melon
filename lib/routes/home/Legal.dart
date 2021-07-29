import "package:flutter/material.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/functions.dart";

class LegalPage extends StatefulWidget {
  @override
  LegalPageState createState() => LegalPageState();
}

class LegalPageState extends State<LegalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            header(context, "Legal"),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30)
                  .add(const EdgeInsets.only(top: 19)),
              child: const Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                style: TextStyle(fontSize: 16, color: AppColors.primaryColor),
              ),
            ),
            Container(
                width: width(context),
                height: (height(context) / 2) + 100,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(
                  top: 40,
                ),
                child: ListView(
                  children: const <Widget>[
                    Text(
                      """
                   Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.

Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.

Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.""",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                )),
            Container(
                margin: const EdgeInsets.only(
                  bottom: 30,
                ).add(const EdgeInsets.symmetric(horizontal: 30)),
                child: AppButton("Confirm", onPressed: () => pop(context)))
          ],
        ),
      ),
    );
  }
}
