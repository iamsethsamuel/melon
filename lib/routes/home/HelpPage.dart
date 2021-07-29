import "package:flutter/material.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/functions.dart";

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);
  @override
  HelpPageState createState() => HelpPageState();
}

class HelpPageState extends State<HelpPage> {
  TextEditingController amountcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 27, left: 20),
                  child: TextButton(
                      onPressed: () => pop(context),
                      child: Row(
                        children: <Widget>[
                          const Icon(Icons.arrow_back_ios),
                          const Text("Back"),
                          Container(
                            margin: const EdgeInsets.only(left: 57),
                            child: const Text(
                              "Help Center",
                              style: TextStyle(
                                  color: AppColors.buttonColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      )),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              width: width(context),
              child: Container(
                color: AppColors.fadedPrimary,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "Get Help Now",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                            "Chat with a customer success in real-time")),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(top: 20),
                      child: Container(
                        width: 150,
                        color: AppColors.primaryColor.withOpacity(.8),
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Start Live Chat",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: width(context),
              child: Container(
                color: AppColors.fadedPrimary,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "Self Help",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                            "Search for answers in our community knowledge base")),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: TextButton(
                          onPressed: () {},
                          child: Row(
                            children: const <Widget>[
                              Text(
                                "Check Out our Customer ",
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                "Portal FAQs",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: width(context),
              child: Container(
                color: AppColors.fadedPrimary,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "Direct Contact",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                            "Support agents are available 24/7/365")),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: width(context),
              child: Container(
                color: AppColors.fadedPrimary,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "Email",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        child: const Text("info@melon.africa")),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {},
        child: const Icon(Icons.message_outlined),
      ),
    );
  }
}
