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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      children: [Page1(), Page2(), Page3(), Page4()],
    ));
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            top: 41,
            width: width(context),
            right: 120,
            child: Container(
                width: 114.79,
                height: 27.96,
                margin:const EdgeInsets.only(top: 41, left: 48),
                child: Logo())),
        Positioned(
            left: (width(context) / 2) - 45,
            top: 0,
            child: Container(
              child: Text(
                "m",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: AppColors.primaryColor,
                  fontSize: 529,
                ),
              ),
            )),
        Positioned(
            top: 140.52,
            width: width(context),
            child: Container(
                height: 300.96,
                child: Image.asset("assets/images/vector_black_lady.png"))),
        Positioned(
            top: 488,
            width: width(context),
            child: Container(
                child: Text(
              "Introducing \r\n a Shocking Juicy Platform",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w700),
            ))),
        Positioned(
            top: 556,
            width: width(context),
            child: Container(
                alignment: Alignment.center,
                margin:const EdgeInsets.symmetric(horizontal: 50),
                child:const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suscipit dolor amet enim sed. Eu ante elementum, aenean quis. ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10),
                ))),
        Positioned(
            top: 613,
            left: 290,
            child: Container(
              height: 13,
              width: 62,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      margin:const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: index == 0
                              ? AppColors.primaryColor
                              : Colors.grey),
                      height: 13,
                      width: 13,
                    );
                  }),
            )),
        Positioned(
            width: 321,
            top: 672,
            height: 52,
            child: AppButton(
              "Get Started",
              onPressed: () => pushReplacement(context,const GetStarted()),
            ))
      ],
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            top: 41,
            right: 120,
            width: width(context),
            child: Container(
                width: 114.79,
                height: 27.96,
                margin:const EdgeInsets.only(top: 41, left: 48),
                child: Logo())),
        Positioned(
            top: 90,
            left: (width(context) / 3) - 65,
            child: Container(
              child: Text(
                "e",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: AppColors.primaryColor,
                  fontSize: 400,
                ),
              ),
            )),
        Positioned(
            top: 140.52,
            width: width(context),
            child: Container(
                height: 300.96,
                child: Image.asset("assets/images/vector_black_man.png"))),
        Positioned(
            top: 488,
            width: width(context),
            child: Container(
                child: Text(
              "Create an Easy Payment \r\n Process",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w700),
            ))),
        Positioned(
            top: 556,
            width: width(context),
            child: Container(
                alignment: Alignment.center,
                margin:const EdgeInsets.symmetric(horizontal: 50),
                child:const Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suscipit dolor amet enim sed. Eu ante elementum, aenean quis. ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10),
                ))),
        Positioned(
            top: 613,
            left: 290,
            child: Container(
              height: 13,
              width: 62,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      margin:const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: index == 1
                              ? AppColors.primaryColor
                              : Colors.grey),
                      height: 13,
                      width: 13,
                    );
                  }),
            )),
        Positioned(
            width: 321,
            top: 672,
            height: 52,
            child: AppButton(
              "Get Started",
              onPressed: () => pushReplacement(context,const GetStarted()),
            ))
      ],
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            top: 41,
            right: 120,
            width: width(context),
            child: Container(
                width: 114.79,
                height: 27.96,
                margin:const EdgeInsets.only(top: 41, left: 48),
                child: Logo())),
        Positioned(
            top: 90,
            left: (width(context) / 3) - 65,
            child: Container(
              child: Text(
                "n",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: AppColors.primaryColor,
                  fontSize: 400,
                ),
              ),
            )),
        Positioned(
            top: 140.52,
            width: width(context),
            child: Container(
                height: 300.96,
                child: Image.asset("assets/images/vector_black_lady_1.png"))),
        Positioned(
            top: 488,
            width: width(context),
            child: Container(
                child: Text(
              "Amazing Settings to make \n\r it easy",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w700),
            ))),
        Positioned(
            top: 556,
            width: width(context),
            child: Container(
                alignment: Alignment.center,
                margin:const EdgeInsets.symmetric(horizontal: 50),
                child:const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suscipit dolor amet enim sed. Eu ante elementum, aenean quis. ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                ))),
        Positioned(
            top: 613,
            left: 290,
            child: Container(
              height: 13,
              width: 62,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      margin:const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: index == 2
                              ? AppColors.primaryColor
                              : Colors.grey),
                      height: 13,
                      width: 13,
                    );
                  }),
            )),
        Positioned(
            width: 321,
            top: 672,
            height: 52,
            child: AppButton(
              "Get Started",
              onPressed: () => pushReplacement(context,const GetStarted()),
            ))
      ],
    );
  }
}

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            top: 102.27,
            child: Container(height: 27.96, width: 114.79, child: Logo())),
        Positioned(
            top: 172,
            child: Text(
              "Choose Account Type",
              style: TextStyle(fontSize: 20, color: AppColors.buttonColor),
            )),
        Positioned(
            top: 237.8,
            child: Container(
              width: 290,
              height: 151,
              padding:const EdgeInsets.all(30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.primaryColor),
              child: Column(
                children: [
                  Container(
                    child:const Text(
                      "Personal Account",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    margin:const EdgeInsets.only(top: 10),
                    child: Text(
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
            )),
        Positioned(
            top: 407.8,
            child: Container(
              width: 290,
              height: 151,
              padding:const EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.primaryColor),
              ),
              child: Column(
                children: [
                  Container(
                    child: Text(
                      "Business Account",
                      style: TextStyle(
                          color: AppColors.buttonColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    margin:const EdgeInsets.only(top: 10),
                    child: Text(
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
            )),
        Positioned(
            width: width(context),
            top: 588,
            child: Container(
              width: width(context),
              padding:const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(primary: AppColors.primaryColor),
                onPressed: () => pushReplacement(context,const AuthPage()),
                child: const Text(
                  "Log in Account",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            )),
        Positioned(
          top: 656.8,
          child: Container(
            width: 249,
            margin:const EdgeInsets.only(top: 10),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suscipit dolor amet enim sed. Eu ante elementum, aenean quis. ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColors.buttonColor),
            ),
          ),
        )
      ],
    );
  }
}
