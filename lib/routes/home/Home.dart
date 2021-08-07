import "package:flutter/material.dart";
import "package:melon/classes/classes.dart";
import "package:melon/models/models.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/data.dart";
import "package:melon/utils/functions.dart";
import "package:provider/provider.dart";

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  List records = [];
  @override
  Widget build(BuildContext context) {
    return Consumer<WalletModel>(builder: (context, wallet, child) {
      records = wallet.wallet.records!.reversed.toList();

      return ListView(
        children: [
          Container(
            height: (height(context) / 3) + 60,
            color: const Color(0xFF0B3D48).withOpacity(0.09),
            child: Column(children: [
              Container(
                  margin: const EdgeInsets.only(top: 30),
                  width: width(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(height: 27.96, width: 150, child: const Logo()),
                      Container(
                        height: 28,
                        margin: const EdgeInsets.only(right: 20),
                        child: const CircleAvatar(
                          backgroundImage: AssetImage(
                            "assets/images/vector_black_lady_1.png",
                          ),
                        ),
                      )
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            color: AppColors.buttonColor,
                            height: 2,
                            width: 100,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: const Text("NGN"),
                          ),
                          Container(
                            color: AppColors.buttonColor,
                            height: 2,
                            width: 100,
                          ),
                        ],
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Text(
                            "${wallet.wallet.balance.toString()} NGN",
                            style: const TextStyle(
                                fontSize: 44, fontWeight: FontWeight.bold),
                          )),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: const Text("Balance"),
                      )
                    ],
                  )),
              Container(
                height: 75,
                width: 317,
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.buttonColor)),
                child: Row(
                  children: <Widget>[
                    for (int i = 0; i < menuItems.length; i++)
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => push(context, menuRoute[i]),
                            child: Column(
                              children: [
                                Container(
                                  height: 39,
                                  width: 70,
                                  child: Icon(
                                    menuIcon[i],
                                    color: AppColors.buttonColor,
                                  ),
                                ),
                                Container(
                                  child: Text(menuItems[i].toString()),
                                ),
                              ],
                            ),
                          ),
                          if (i != (menuItems.length - 1))
                            Container(
                              height: 39,
                              width: 2,
                              color: AppColors.buttonColor,
                            )
                        ],
                      )
                  ],
                ),
              )
            ]),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                if (records == null || records.isEmpty)
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 150),
                    child: const Text(
                      "You don't have any record yet",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  )
                else
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
                                  if (records[index]["type"] == "sent")
                                    const Icon(
                                      Icons.qr_code_2_rounded,
                                      size: 35,
                                    ),
                                  if (records[index]["type"] == "recieved")
                                    const Icon(
                                      Icons.account_balance_wallet_outlined,
                                      size: 35,
                                    ),
                                  Column(
                                    children: [
                                      Container(
                                        width: 189,
                                        child: Text(
                                          records[index]["description"]
                                              as String,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.bottomLeft,
                                        width: 189,
                                        child: Text(
                                          records[index]["date"]
                                              .toString()
                                              .substring(
                                                  0,
                                                  records[index]["date"]
                                                      .toString()
                                                      .indexOf("T")),
                                          style: const TextStyle(fontSize: 11),
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    width: 90,
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                        records[index]["amount"].toString(),
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
        ],
      );
    });
  }
}
