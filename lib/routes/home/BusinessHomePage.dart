import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:melon/routes/business/BussinessHome.dart";
import "package:melon/routes/business/GenerateQRCode.dart";
import "package:melon/routes/business/QRCodePage.dart";
import "package:melon/routes/home/Menu.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/functions.dart";

class BusinessHomePage extends StatefulWidget {
  const BusinessHomePage({Key? key, this.page}) : super(key: key);
  final int? page;
  @override
  BusinessHomePageState createState() => BusinessHomePageState();
}

class BusinessHomePageState extends State<BusinessHomePage> {
  int? page;
  List<Widget> pages = <Widget>[
    const BusinessHome(),
    Container(),
    QRCodePage(),
    GenerateQRCode(),
    Menu()
  ];
  @override
  void initState() {
    page = widget.page ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pages[page!]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          if (index == 2) {
            push(context, QRCodePage());
            return;
          }
          if (index == 3) {
            push(context, GenerateQRCode());
            return;
          }
          setState(() => page = index);
        },
        currentIndex: page!,
        selectedItemColor: AppColors.primaryColor,
        selectedLabelStyle: const TextStyle(color: AppColors.buttonColor),
        unselectedLabelStyle: const TextStyle(color: AppColors.buttonColor),
        backgroundColor: Colors.white,
        showUnselectedLabels: true,
        unselectedItemColor: AppColors.buttonColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(50)),
                child: const Icon(
                  Icons.home_rounded,
                  color: Colors.white,
                ),
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColors.buttonColor,
                    borderRadius: BorderRadius.circular(50)),
                child: const Icon(
                  Icons.book,
                  color: Colors.white,
                  size: 22,
                ),
              ),
              label: "Invoice"),
          BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(50)),
                child: const Icon(
                  Icons.qr_code_2_rounded,
                  size: 32,
                  color: Colors.white,
                ),
              ),
              label: " "),
          BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColors.buttonColor,
                    borderRadius: BorderRadius.circular(50)),
                child: const Icon(
                  Icons.credit_card_outlined,
                  color: Colors.white,
                ),
              ),
              label: "Payment"),
          BottomNavigationBarItem(
              icon: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  height: 40,
                  width: 40,
                  child: Image.asset("assets/images/o.png")),
              label: "Menu"),
        ],
      ),
    );
  }
}
