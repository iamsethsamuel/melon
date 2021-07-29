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
  @override
  Widget build(BuildContext context) {
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
                    child: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Zendaya_-_2019_by_Glenn_Francis.jpg/220px-Zendaya_-_2019_by_Glenn_Francis.jpg"),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: width(context),
                    child: Text(
                      widget.code,
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
                        child: const Text("Insufficient Fund"),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: width(context),
                          child: const Text("Description"),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                hintStyle: TextStyle(fontSize: 11)),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                    ConfirmPayment(
                        amount: amountcontroller.text, user: widget.code),
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
