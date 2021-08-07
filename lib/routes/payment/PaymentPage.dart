import 'dart:convert';

import "package:flutter/material.dart";
import "package:melon/routes/payment/ConfirmPayment.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/functions.dart";

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key, required this.code}) : super(key: key);
  final String code;
  @override
  PaymentPageState createState() => PaymentPageState();
}

class PaymentPageState extends State<PaymentPage> {
  TextEditingController amountcontroller = TextEditingController();
  TextEditingController description = TextEditingController();

  String err = "";

  @override
  Widget build(BuildContext context) {
    final Map code = jsonDecode(widget.code) as Map;
    amountcontroller.text = code["amount"].toString();

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            header(context, "Input Amount"),
            Container(
              margin: const EdgeInsets.only(top: 100)
                  .add(const EdgeInsets.symmetric(horizontal: 30)),
              width: width(context),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 127,
                    width: 127,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(code["name"].toString()),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: width(context),
                    child: Text(
                      "${code["name"]}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20)
                  .add(const EdgeInsets.symmetric(horizontal: 30)),
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        width: width(context),
                        child: const Text("Enter Amount"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: amountcontroller,
                          decoration: const InputDecoration(
                              hintStyle: TextStyle(fontSize: 11)),
                        ),
                      ),
                      Container(
                        width: width(context),
                        child: Text(err),
                      ),
                    ],
                  ),
                  CustomTextField(
                    label: "Description",
                    controller: description,
                    textCapitalization: TextCapitalization.sentences,
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 100)
                  .add(const EdgeInsets.symmetric(horizontal: 30)),
              child: AppButton(
                "Confirm Payment",
                onPressed: () {
                  showSnackBar(
                    context,
                    ConfirmPayment(data: {
                      "amount": amountcontroller.text,
                      ...code,
                      "description": description.text
                    },widgetcontext: context,),
                    duration: const Duration(days: 1),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
