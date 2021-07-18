import "package:flutter/material.dart";
import "package:melon/routes/welcome/GetStarted.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/functions.dart";
import "package:melon/utils/utils.dart";

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String _language = "English";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: Future.delayed(const Duration(milliseconds: 3), () {
            return "done";
          }),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Stack(
                alignment: Alignment.center,
                children: <Widget>[
                Positioned(
                    top: 116.85,
                    bottom: percentage(78.44, height(context)),
                    child: Container(
                      alignment: Alignment.center,
                      width: width(context),
                      height: 49.2,
                      child: Logo(),
                    )),
                Positioned(
                    top: 208,
                    height: 45,
                    child: Container(
                      alignment: Alignment.center,
                      width: width(context),
                      child:const Center(
                          child: Text(
                        "Choose your Prefered Language",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      )),
                    )),
                Positioned(
                    top: 305,
                    width: width(context),
                    child: Container(
                      alignment: Alignment.center,
                      padding:const EdgeInsets.symmetric(horizontal: 50),
                      height: 50,
                      child: DropdownButton(
                          underline: Container(
                            padding:const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColors.primaryColor)),
                            width: 280,
                            height: 40,
                          ),
                          isExpanded: true,
                          icon:const Icon(Icons.arrow_downward,
                              color: Color(0xFFAAD24B)),
                          onChanged: (value) {
                            setState(() {
                              _language = value.toString();
                            });
                          },
                          value: _language,
                          items: [
                            for (String language in languages)
                              DropdownMenuItem(
                                value: language,
                                child: Container(
                                    margin: const EdgeInsets.all(15),
                                    child: Text(language)),
                              ),
                          ]),
                    )),
                Positioned(
                    width: 321,
                    top: 672,
                    height: 52,
                    child: AppButton(
                        "Get Started",
                      onPressed: () =>pushReplacement(context,const GetStarted()),
                    ))
              ]);
            } else {
              return Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    bottom: percentage(34.12, width(context)),
                  ),
                  child: Logo());
            }
          }),
    );
  }
}
