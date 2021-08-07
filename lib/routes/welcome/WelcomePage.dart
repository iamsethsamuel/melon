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
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: [
                        Container(
                            width: width(context),
                            margin: const EdgeInsets.only(top: 141),
                            alignment: Alignment.center,
                            child: const Logo(
                              logowidth: 200,
                            )),
                        Container(
                            alignment: Alignment.center,
                            width: width(context),
                            child: Container(
                                margin: const EdgeInsets.only(top: 30),
                                child: const Text(
                                  "Choose your Prefered Language",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.center,
                                ))),
                        Container(
                            width: width(context),
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 40)
                                .add(const EdgeInsets.only(top: 100)),
                            child: DropdownButton(
                                underline: Container(
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.primaryColor)),
                                  width: 280,
                                  height: 40,
                                ),
                                isExpanded: true,
                                icon: Container(
                                  margin: const EdgeInsets.only(
                                      bottom: 10, right: 5),
                                  child: const Icon(Icons.arrow_downward,
                                      color: Color(0xFFAAD24B)),
                                ),
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
                                          margin: const EdgeInsets.all(15)
                                              .subtract(const EdgeInsets.only(
                                                  top: 10)),
                                          child: Text(language)),
                                    ),
                                ])),
                      ],
                    ),
                    Container(
                        width: 321,
                        margin: const EdgeInsets.only(bottom: 50)
                            .add(const EdgeInsets.symmetric(horizontal: 30)),
                        child: AppButton(
                          "Get Started",
                          onPressed: () =>
                              push(context, const GetStarted()),
                        ))
                  ]);
            } else {
              return Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    bottom: percentage(34.12, width(context)),
                  ),
                  child: const Logo());
            }
          }),
    );
  }
}
