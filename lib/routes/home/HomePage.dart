import "package:flutter/material.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/data.dart";
import "package:melon/utils/functions.dart";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: (height(context) / 3) + 50,
              color:const  Color(0xFF0B3D48).withOpacity(0.09),
              child: Column(children: [
                Container(
                    margin:const  EdgeInsets.only(top: 30),
                    width: width(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(height: 27.96, width: 150, child: Logo()),
                        Container(
                          height: 28,
                          margin:const  EdgeInsets.only(right: 20),
                          child:const  CircleAvatar(
                            backgroundImage: AssetImage(
                              "assets/images/vector_black_lady_1.png",
                            ),
                          ),
                        )
                      ],
                    )),
                Container(
                    margin:const  EdgeInsets.only(top: 50),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              color: AppColors.buttonColor,
                              height: 2,
                              width: 100,
                            ),
                            Container(
                              margin:const  EdgeInsets.symmetric(horizontal: 10),
                              child:const  Text("NGN"),
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
                          child: const Text(
                            "1,000,000,000",
                            style: TextStyle(
                                fontSize: 44, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: const Text("Balance"),
                        )
                      ],
                    )),
                Container(
                  height: 75,
                  width: 317,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.buttonColor)),
                  child: Row(
                    children: [
                      for (Map item in [
                        {
                          "icon": Icons.qr_code_2_rounded,
                          "name": "Scan",
                          "divider": Container(
                            height: 39,
                            width: 2,
                            color: AppColors.buttonColor,
                          ),
                          "route": () {}
                        },
                        {
                          "icon": Icons.money,
                          "name": "Payment",
                          "divider": Container(
                            height: 39,
                            width: 2,
                            color: AppColors.buttonColor,
                          ),
                          "route": () {}
                        },
                        {
                          "icon": Icons.account_balance_wallet_outlined,
                          "name": "Fund",
                          "divider": Container(
                            height: 39,
                            width: 2,
                            color: AppColors.buttonColor,
                          ),
                          "route": () {}
                        },
                        {
                          "icon": Icons.savings_rounded,
                          "name": "Save",
                          "route": () {}
                        }
                      ])
                        Row(
                          children: [
                            GestureDetector(
                              onTap: item["route"],
                              child: Column(
                                children: [
                                  Container(
                                    height: 39,
                                    width: 70,
                                    child: Icon(
                                      item["icon"],
                                      color: AppColors.buttonColor,
                                    ),
                                  ),
                                  Container(
                                    child: Text(item["name"]),
                                  ),
                                ],
                              ),
                            ),
                            if (item["divider"] != null) item["divider"]
                          ],
                        )
                    ],
                  ),
                )
              ]),
            ),
            Container(
              margin:const EdgeInsets.only(top: 20),
              padding:const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Container(
                            child:const Icon(
                              Icons.history_edu,
                              size: 44,
                            ),
                          ),
                          Container(
                              child:const Text(
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
                            padding:const EdgeInsets.all(7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    child:const  Text(
                                  "12th - 15th",
                                  style: TextStyle(fontSize: 12),
                                )),
                                Container(
                                  child:const  Icon(
                                    Icons.arrow_drop_down_rounded,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ]),
                  Container(
                    margin:const  EdgeInsets.only(top: 20),
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
                                children: [
                                  if (records[index]["type"] == "scan") const Icon(
                                          Icons.qr_code_2_rounded,
                                          size: 45,
                                        ) else const Icon(
                                          Icons.account_balance_wallet_outlined,
                                          size: 45,
                                        ),
                                  Column(
                                    children: [
                                      Container(
                                        width: 134,
                                        child: Text(
                                          records[index]["description"]??"",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.bottomLeft,
                                        width: 134,
                                        child: Text(
                                          records[index]["date"]??"",
                                          style: const  TextStyle(fontSize: 11),
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    width: 134,
                                    child: Text(records[index]["amount"]??"",
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
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index){
          setState(() => page = index
          );
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
                color: page == 0?AppColors.primaryColor:AppColors.buttonColor,
              ),
                backgroundColor: page == 0?AppColors.primaryColor:AppColors.buttonColor,

              label: "Home"),
          BottomNavigationBarItem(
              icon: MaterialRadio(
                                color: page == 1?AppColors.primaryColor:AppColors.buttonColor,

                size: 29,
                disenabled: true,
              ),
                backgroundColor: page == 1?AppColors.buttonColor:AppColors.primaryColor,

              label: "Menu"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_outlined,
                color: page == 2?AppColors.primaryColor:AppColors.buttonColor,              
              ),
                backgroundColor: page == 2?AppColors.buttonColor:AppColors.primaryColor,

              label: "Profile")
        ],
      ),
    );
  }
}
