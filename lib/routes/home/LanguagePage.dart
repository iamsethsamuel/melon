import "package:flutter/material.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/functions.dart";
import "package:melon/utils/utils.dart";

class LanguagePage extends StatefulWidget {
  @override
  LanguagePageState createState() => LanguagePageState();
}

class LanguagePageState extends State<LanguagePage> {
  String _language = "English";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            header(context, "Language"),
            Container(
                width: width(context),
                margin: const EdgeInsets.only(top: 40, bottom: 400),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: width(context),
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(bottom: 10),
                        child: const Text(
                          "Select Option",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      DropdownButton(
                          iconEnabledColor: AppColors.buttonColor,
                          underline: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColors.primaryColor)),
                            width: 280,
                            height: 40,
                          ),
                          isExpanded: true,
                          icon: Container(margin:const EdgeInsets.only(bottom: 20, right: 10),
                            child: const RotatedBox(
                              quarterTurns: 3,
                              child: Icon(Icons.arrow_back_ios,
                                  color: AppColors.primaryColor),
                            ),
                          ),
                          onChanged: (Object? value) {
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
                                    child: Text(
                                      language,
                                      style: const TextStyle(
                                          color: AppColors.buttonColor),
                                    )),
                              ),
                          ]),
                    ],
                  ),
                )),
            Container(margin: const EdgeInsets.only(bottom: 30,).add(const EdgeInsets.symmetric(horizontal: 30)),child: AppButton("Confirm", onPressed: () => pop(context)))
          ],
        ),
      ),
    );
  }
}
