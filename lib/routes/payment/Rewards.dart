import "package:flutter/material.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/functions.dart";

class Rewards extends StatefulWidget {
  const Rewards({Key? key}) : super(key: key);
  @override
  RewardsState createState() => RewardsState();
}

class RewardsState extends State<Rewards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Center(
            child: Container(
              width: 300,
              color: AppColors.fadedPrimary,
              margin: const EdgeInsets.only(top: 150),
              padding: const EdgeInsets.all(20),
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        width: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Text(
                              "2% ",
                            ),
                            Text(
                              "Cashback",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Container(width: 80, child: const Text("#1,000.00")),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(bottom: 30)
                  .add(const EdgeInsets.symmetric(horizontal: 30)),
              child: AppButton("Close", onPressed: () => pop(context)))
        ],
      )),
    );
  }
}
