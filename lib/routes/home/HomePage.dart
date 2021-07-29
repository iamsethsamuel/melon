import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:melon/routes/home/Home.dart";
import "package:melon/routes/home/Menu.dart";
import "package:melon/routes/user/Profile.dart";
import "package:melon/utils/GlobalWidgets.dart";

class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.page}) : super(key: key);
  final int? page;
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int? page;
  List<Widget> pages = <Widget>[const Home(), Menu(), AccountProfile()];
  @override
  void initState() {
    page=widget.page ?? 0;

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pages[page!]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() => page = index);
        },
        currentIndex: page!,
        selectedItemColor: AppColors.primaryColor,
        selectedLabelStyle:const TextStyle(color: AppColors.buttonColor),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
                color:
                    page == 0 ? AppColors.primaryColor : AppColors.buttonColor,
              ),
              backgroundColor:
                  page == 0 ? AppColors.primaryColor : AppColors.buttonColor,
              label: "Home"),
          BottomNavigationBarItem(
              icon: Container(height: 30,child: Image.asset("assets/images/o.png")),
              backgroundColor:
                  page == 1 ? AppColors.buttonColor : AppColors.primaryColor,
              label: "Menu"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline_outlined,
                color:
                    page == 2 ? AppColors.primaryColor : AppColors.buttonColor,
              ),
              backgroundColor:
                  page == 2 ? AppColors.buttonColor : AppColors.primaryColor,
              label: "Profile")
        ],
      ),
    );
  }
}
