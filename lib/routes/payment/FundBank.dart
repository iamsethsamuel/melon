import "package:flutter/material.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/functions.dart";

class FundBank extends StatefulWidget {
  @override
  _FundBankState createState() => _FundBankState();
}

class _FundBankState extends State<FundBank> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
          Container(
            width: width(context),
            child: Column(
              children: [
                header(context, "Bank Transfer"),
                Container(
                  margin:const EdgeInsets.all(30),
                  child: const Text(
                    "Fund your melon account by simply transfering from any bank all you need is to supply the details below.",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      const CustomTextField(
                        label: "Bank",
                        hint: "Kuda Bank",
                      ),
                      CustomTextField(
                        label: "Account Number",
                        hint: "xxxx xxxx ",
                        suffix: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.copy,
                          ),
                        ),
                      ),
                      CustomTextField(
                        label: "Account Name",
                        hint: "John Doe",
                        suffix: IconButton(
                          onPressed: () {},
                          icon: const RotatedBox(
                            quarterTurns: 3,
                            child: Icon(
                              Icons.arrow_back_ios_outlined,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 30)
                .add(const EdgeInsets.symmetric(horizontal: 30)),
            child: AppButton(
              "Copy Full Details",
              onPressed: () {},
            ),
          )
        ])));
  }
}
