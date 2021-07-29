import "package:flutter/material.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/data.dart";
import "package:melon/utils/functions.dart";

class PaymentsHistory extends StatefulWidget {
  const PaymentsHistory({Key? key}) : super(key: key);
  @override
  PaymentsHistoryState createState() => PaymentsHistoryState();
}

class PaymentsHistoryState extends State<PaymentsHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            header(context, ""),
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(20),
              width: width(context),
              height: (height(context) / 2) + 100,
              child: ListView(
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(children: <Widget>[
                          Container(
                            child: const Icon(
                              Icons.history_edu,
                              size: 44,
                            ),
                          ),
                          Container(
                              child: const Text(
                            "Transaction \r\nHistory",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ))
                        ]),
                        GestureDetector(
                          onTap: () {
                            showAboutDialog(context: context);
                          },
                          child: Container(
                            height: 33,
                            width: 103,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border:
                                    Border.all(color: AppColors.buttonColor)),
                            padding: const EdgeInsets.all(7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    child: const Text(
                                  "12th - 15th",
                                  style: TextStyle(fontSize: 12),
                                )),
                                Container(
                                  child: const Icon(
                                    Icons.arrow_drop_down_rounded,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ]),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        for (int index = 0; index < records.length; index++)
                          Column(
                            children: [
                              Container(
                                width: 325,
                                height: 2,
                                color: AppColors.primaryColor,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  if (records[index]["type"] == "scan")
                                    const Icon(
                                      Icons.qr_code_2_rounded,
                                      size: 45,
                                    )
                                  else
                                    const Icon(
                                      Icons.account_balance_wallet_outlined,
                                      size: 45,
                                    ),
                                  Column(
                                    children: [
                                      Container(
                                        width: 134,
                                        child: Text(
                                          records[index]["description"] as String,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.bottomLeft,
                                        width: 134,
                                        child: Text(
                                          records[index]["date"] as String,
                                          style: const TextStyle(fontSize: 11),
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    width: 134,
                                    child: Text(records[index]["amount"] as String,
                                        style: TextStyle(
                                            color: index % 2 == 0
                                                ? AppColors.buttonColor
                                                : AppColors.primaryColor,
                                            fontSize: 16)),
                                  )
                                ],
                              ),
                            ],
                          )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: SizedBox(
                width: 130,
                child: TextButton(
                  style:
                      ElevatedButton.styleFrom(primary: AppColors.fadedPrimary),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Generate PDF"),
                      Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: const Icon(
                            Icons.picture_as_pdf,
                            color: AppColors.primaryColor,
                          ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
