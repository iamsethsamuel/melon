import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:melon/routes/payment/ConfirmPayment.dart";
import "package:melon/routes/payment/PaymentPage.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/data.dart";
import "package:melon/utils/functions.dart";

class BankTransfer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            header(context, "Transfer"),
            Container(
              height: 120,
              width: width(context),
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Beneficiaries"),
                      Container(
                        width: 150,
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                              filled: false,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              prefixIcon: const Icon(Icons.search),
                              hintText: "Search"),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Container(
                            constraints: const BoxConstraints(maxHeight: 40),
                            margin: const EdgeInsets.only(bottom: 20),
                            height: 60,
                            width: 40,
                            child: Container(
                              color: Colors.grey.withOpacity(.2),
                              constraints: const BoxConstraints(maxHeight: 40),
                              height: 40,
                              child: const Icon(
                                Icons.add,
                                size: 40,
                              ),
                            )),
                        Container(
                          width: width(context) - 100,
                          height: 60,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: bankTransferData.length,
                              itemBuilder: (_, index) {
                                return SizedBox(
                                  width: 60,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 60,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 2),
                                        padding: const EdgeInsets.all(5),
                                        color: Colors.grey.withOpacity(.2),
                                        child: Image.asset(
                                            "assets/images/${bankTransferData[index]["bank"]}.png"),
                                      ),
                                      SizedBox(
                                        width: 60,
                                        child: Text(
                                          bankTransferData[index]["name"]
                                              as String,
                                          style: const TextStyle(fontSize: 9),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30)
                  .add(const EdgeInsets.only(bottom: 60)),
              child: Column(
                children: [
                  CustomTextField(label: "Enter Amount",hint: "0.00",),
                  CustomTextField(
                    label: "Bank",
                    hint: "Choose Bank",
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
                  CustomTextField(label: "Account Number"),
                  CustomTextField(label: "Description"),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 30)
                  .add(const EdgeInsets.symmetric(horizontal: 30)),
              child: AppButton(
                "Next",
                onPressed: () => showSnackBar(
                    context,
                    Container(height: (height(context)/2)+90,
                      child: const ConfirmPayment(
                        data:{"user": "Ridwan Olumide",
                        "amount": "2000",}
                      ),
                    ),duration: const Duration(days: 1)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
