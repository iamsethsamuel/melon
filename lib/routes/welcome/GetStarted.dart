import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:melon/routes/user/auth/AuthPage.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/functions.dart";

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);
  @override
  GetStartedState createState() => GetStartedState();
}

class GetStartedState extends State<GetStarted> {
  final PageController _pageController = PageController();
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Container(
              alignment: Alignment.centerLeft,
              width: width(context),
              margin: const EdgeInsets.only(top: 61, left: 30),
              child: const Logo(
                logowidth: 114,
              )),
          Container(
            height: (height(context) / 2) + 75,
            width: width(context),
            child: PageView(
              controller: _pageController,
              onPageChanged: (int currentPage) {
                setState(() {
                  page = currentPage;
                });
              },
              children: [Page1(), Page2(), Page3()],
            ),
          ),
          Container(
            height: 13,
            width: width(context),
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 110,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: index == page
                              ? AppColors.primaryColor
                              : Colors.grey),
                      height: 13,
                      width: 13,
                    );
                  }),
            ),
          ),
          Container(
              width: width(context),
              margin: const EdgeInsets.symmetric(horizontal: 40)
                  .add(const EdgeInsets.only(bottom: 50)),
              height: 52,
              child: AppButton(
                "Get Started",
                onPressed: () => pushReplacement(context, LoginSignupPage()),
              ))
        ]));
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40),
          height: 300,
          width: width(context),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  left: (width(context) / 2) - 25,
                  bottom: 0,
                  child: Container(
                    child: Image.asset("assets/images/m.png"),
                  )),
              Positioned(
                  bottom: 0,
                  child: Container(
                      height: 300.96,
                      child:
                          Image.asset("assets/images/vector_black_lady.png"))),
            ],
          ),
        ),
        Container(
            width: width(context),
            margin: const EdgeInsets.only(top: 30),
            child: const Text(
              "Introducing \r\n a Shocking Juicy Platform",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w700),
            )),
        Container(
            width: width(context),
            margin: const EdgeInsets.only(top: 14),
            child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suscipit dolor amet enim sed. Eu ante elementum, aenean quis. ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10),
                ))),
      ],
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40),
          height: 300,
          width: width(context),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  bottom: 0,
                  height: 209,
                  width: 214,
                  child: Container(
                    width: 314,
                    height: 309,
                    child: Image.asset("assets/images/e.png"),
                  )),
              Positioned(
                  bottom: 0,
                  child: Container(
                      height: 300.96,
                      child:
                          Image.asset("assets/images/vector_black_man.png"))),
            ],
          ),
        ),
        Container(
            width: width(context),
            margin: const EdgeInsets.only(top: 30),
            child: const Text(
              "Create an Easy Payment \r\n Process",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w700),
            )),
        Container(
            width: width(context),
            margin: const EdgeInsets.only(top: 14),
            child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suscipit dolor amet enim sed. Eu ante elementum, aenean quis. ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10),
                ))),
      ],
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40),
          height: 300,
          width: width(context),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  bottom: 0,
                  height: 209,
                  width: 214,
                  left: 30,
                  child: Container(
                    width: 314,
                    height: 309,
                    child: Image.asset("assets/images/n.png"),
                  )),
              Positioned(
                  bottom: 0,
                  child: Container(
                      height: 300.96,
                      child: Image.asset(
                          "assets/images/vector_black_lady_1.png"))),
            ],
          ),
        ),
        Container(
            width: width(context),
            margin: const EdgeInsets.only(top: 30),
            child: const Text(
              "Amazing Settings to make \n\r it easy",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w700),
            )),
        Container(
            width: width(context),
            margin: const EdgeInsets.only(top: 14),
            child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suscipit dolor amet enim sed. Eu ante elementum, aenean quis. ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10),
                ))),
      ],
    );
  }
}

class LoginSignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                margin: const EdgeInsets.only(top: 100),
                height: 27.96,
                width: 114.79,
                child: const Logo()),
            const Text(
              "Choose Account Type",
              style: TextStyle(fontSize: 20, color: AppColors.buttonColor),
            ),
            Container(
              width: 290,
              height: 151,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.primaryColor),
              child: Column(
                children: [
                  Container(
                    child: const Text(
                      "Personal Account",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suscipit dolor amet enim sed. Eu ante elementum, aenean quis. ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: AppColors.buttonColor),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 290,
              height: 151,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.primaryColor),
              ),
              child: Column(
                children: [
                  Container(
                    child: const Text(
                      "Business Account",
                      style: TextStyle(
                          color: AppColors.buttonColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suscipit dolor amet enim sed. Eu ante elementum, aenean quis. ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: AppColors.buttonColor),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: width(context),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                color: AppColors.primaryColor,
                alignment: Alignment.center,
                height: 45,
                padding: const EdgeInsets.symmetric(horizontal: 50),
                margin: const EdgeInsets.symmetric(horizontal: 14),
                child: GestureDetector(
                  onTap: () => pushReplacement(context, const AuthPage()),
                  child: const Text(
                    "Log in Account",
                    style: TextStyle(
                        fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                ),
              ),
            ),
            Container(
              width: 249,
              margin: const EdgeInsets.only(bottom: 50)
                  .add(const EdgeInsets.symmetric(horizontal: 30)),
              child: const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suscipit dolor amet enim sed. Eu ante elementum, aenean quis. ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: AppColors.buttonColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
