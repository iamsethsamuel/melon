import "package:flutter/material.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/data.dart";
import "package:melon/utils/functions.dart";

class PayTV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            header(context, "TV"),
            Container(
              width: width(context),
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Recents"),
                      Container(
                        width: 150,
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                              filled: false,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              prefixIcon: const Icon(Icons.search),
                              hintText: "Search"),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Container(
                          width: width(context) - 100,
                          height: 60,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: tvData.length,
                              itemBuilder: (_, index) {
                                return SizedBox(
                                  width: 60,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 60,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 2),
                                        padding: const EdgeInsets.all(5),
                                        color: Colors.grey.withOpacity(.2),
                                        child: Image.asset(
                                            "assets/images/${tvData[index]["provider"]}.png"),
                                      ),
                                      SizedBox(
                                        width: 60,
                                        child: Text(
                                          tvData[index]["number"] as String,
                                          style: const TextStyle(fontSize: 9),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30)
                  .add(const EdgeInsets.only(bottom: 100)),
              child: Column(
                children: [
                  CustomTextField(
                    label: "Enter Amount",
                    hint: "0.00",
                  ),
                  CustomTextField(
                    label: "Provider",
                    hint: "Choose Provider",
                    suffix: IconButton(
                      onPressed: () {},
                      icon: const RotatedBox(
                        quarterTurns: 3,
                        child: Icon(
                          Icons.arrow_back_ios_outlined,
                        ),
                      ),
                    ),
                  ),
                  CustomTextField(
                    label: "Packages",
                    suffix: IconButton(
                      onPressed: () {},
                      icon: const RotatedBox(
                        quarterTurns: 3,
                        child: Icon(
                          Icons.arrow_back_ios_outlined,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 30)
                  .add(const EdgeInsets.symmetric(horizontal: 30)),
              child: AppButton(
                "Next",
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
