import "package:flutter/material.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/data.dart";
import "package:melon/utils/functions.dart";

class BusinessHome extends StatefulWidget {
  const BusinessHome({Key? key}) : super(key: key);
  @override
  BusinessHomeState createState() => BusinessHomeState();
}

class BusinessHomeState extends State<BusinessHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(children: [
        Container(
          width: width(context),
          height: (height(context) / 3) + 50,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 52,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: const Logo(),
                ),
              ),
              Positioned(
                  child: Container(
                width: width(context),
                height: (height(context) / 3) - 10,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(.2),
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(70))),
              )),
              Positioned(
                  left: 0,
                  top: 100,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          children: [
                            Container(
                              width: (width(context) / 2) + 30,
                              child: const Text(
                                "NGN",
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12),
                              ),
                            ),
                            Container(
                              width: (width(context) / 2) + 30,
                              child: const Text(
                                "10,000,000.00",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 35),
                              ),
                            ),
                            Container(
                              width: (width(context) / 2) + 30,
                              child: const Text(
                                "Available Balance",
                                style: TextStyle(fontSize: 11),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        child: Image.asset("assets/images/orange.png"),
                      )
                    ],
                  )),
              Positioned(
                  top: 190,
                  right: 0,
                  left: 0,
                  child: Container(
                    width: width(context),
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: (width(context) / 2) - 40,
                          height: height(context) / 8,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                              color: AppColors.buttonColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "Money in  ",
                                        style: TextStyle(
                                            color: AppColors.primaryColor,
                                            fontSize: 12),
                                      ),
                                      Container(
                                          height: 14,
                                          width: 14,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color:
                                                      AppColors.primaryColor),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: const Icon(
                                            Icons.add,
                                            size: 12,
                                          ))
                                    ],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 30),
                                    width: (width(context) / 2) + 30,
                                    child: const Text(
                                      "20,000,000.00",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: (width(context) / 2) - 40,
                          height: height(context) / 8,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "Money Out  ",
                                        style: TextStyle(
                                            color: AppColors.buttonColor,
                                            fontSize: 12),
                                      ),
                                      Container(
                                          height: 14,
                                          width: 14,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: AppColors.buttonColor),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: const Icon(
                                            Icons.linear_scale,
                                            color: Colors.white,
                                            size: 10,
                                          ))
                                    ],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 30),
                                    width: (width(context) / 2) + 30,
                                    child: const Text(
                                      "10,000,000.00",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(children: [
                  Container(
                    child: const Icon(
                      Icons.history_edu,
                      size: 44,
                    ),
                  ),
                  Container(
                      child: const Text(
                    "Transaction \r\nHistory",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
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
                        border: Border.all(color: AppColors.buttonColor)),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        )
      ]),
    );
  }
}
