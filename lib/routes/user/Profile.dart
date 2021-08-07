import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:melon/models/models.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/data.dart";
import "package:melon/utils/functions.dart";
import "package:provider/provider.dart";

class AccountProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<UserModel>(builder: (context, user, child) {
          final List<Map<String, String?>> accontPageText =
              <Map<String, String?>>[
            {"title": user.user.name, "text": "Account Name"},
            {"title": user.user.address, "text": "Address"},
            {"title": user.user.phone, "text": "Phone Number"},
            {"title": user.user.email, "text": "Email Address"},
            {"title": "Document", "text": "Verification Document"},
            {
              "title":
                  "${user.user.nextofkin?["firstName"]} ${user.user.nextofkin?["surname"]}",
              "text": "Next of Kin"
            },
          ];

          return Column(
            children: <Widget>[
              header(context, "Account Settings"),
              Container(
                margin: const EdgeInsets.only(top: 30)
                    .add(const EdgeInsets.symmetric(horizontal: 30)),
                padding: const EdgeInsets.all(10),
                color: AppColors.fadedPrimary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              child: Column(
                            children: <Widget>[
                              Container(
                                  width: 152,
                                  alignment: Alignment.topLeft,
                                  child: const Text(
                                    "John Doe",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700),
                                  )),
                              Container(
                                width: 152,
                                margin: const EdgeInsets.all(10),
                                child: const Text("Kuda Bank"),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                        child: const Text(
                                      "1100961189",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                    )),
                                    Container(
                                        height: 16,
                                        margin: const EdgeInsets.only(left: 10),
                                        child: ElevatedButton.icon(
                                          icon: const Icon(
                                            Icons.copy,
                                            size: 13,
                                          ),
                                          label: const Text("Copy"),
                                          onPressed: () {
                                            Clipboard.setData(
                                                const ClipboardData(text: """
        Name: John Doe
        Bank: Kuda Bank
        Account Number: 1100961189
                                              """));
                                          },
                                        ))
                                  ],
                                ),
                              ),
                              Container(
                                  width: 152,
                                  child: const Text(
                                    "Bank Number",
                                    style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w700),
                                  )),
                            ],
                          )),
                          Container(
                            child: Container(
                              height: 68,
                              width: 68,
                              child: const CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Zendaya_-_2019_by_Glenn_Francis.jpg/220px-Zendaya_-_2019_by_Glenn_Francis.jpg"),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    for (int i = 0; i < accontPageText.length; i++)
                      GestureDetector(
                        onTap: () => push(context, profilePageRoutes[i]),
                        child: Container(
                          margin: const EdgeInsets.all(
                            10,
                          ),
                          padding: const EdgeInsets.all(
                            10,
                          ),
                          color: AppColors.fadedPrimary,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(
                                    acountPageIcons[i],
                                    color: AppColors.primaryColor,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          width: 200,
                                          child: Text(
                                            accontPageText[i]["title"]
                                                .toString(),
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          width: 200,
                                          child: Text(
                                            accontPageText[i]["text"]!,
                                            style:
                                                const TextStyle(fontSize: 11),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: AppColors.buttonColor,
                              )
                            ],
                          ),
                        ),
                      )
                  ],
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
