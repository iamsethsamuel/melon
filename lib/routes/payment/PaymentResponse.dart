import "package:flutter/material.dart";
import "package:melon/routes/home/HomePage.dart";
import "package:melon/utils/GlobalWidgets.dart";
import "package:melon/utils/functions.dart";

class PaymentResponse extends StatelessWidget {
  const PaymentResponse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              width: width(context),
              top: 147,
              child: Container(
                height: 205,
                width: 140,
                color: AppColors.fadedPrimary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                   const  Icon(
                      Icons.check_circle,
                      color: AppColors.primaryColor,
                      size: 66,
                    ),
                    Container(
                      child:const  Text(
                        "Payment\nConfirmed",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                width: width(context),
                top: 457,
                child: Container(
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                    const     Text(
                          "Share Receipt",
                          style: TextStyle(fontSize: 16),
                        ),
                        Container(
                          margin:const  EdgeInsets.only(left: 10),
                          child:const  Icon(Icons.share),
                        )
                      ],
                    ),
                  ),
                )),
            Positioned(
                top: 507,
                width: width(context),
                child: Container(
                  padding:const  EdgeInsets.all(10),
                  color:const  Color(0xFFF9FFEB),
                  height: 73,
                  width: 219,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(height: 73,child: Image.asset("assets/images/vector_happy_money.png"),),
                      Column(
                        children:const  <Widget>[
                          Text("2% Cashback"),
                          Text("#1,000.00", style: TextStyle(fontWeight: FontWeight.bold),)
                        ],
                      )
                    ],
                  ),
                )),
            Positioned(
                top: 668,
                width: width(context),
                child: AppButton(
                  "Close",
                  onPressed: () {
                    push(context,const  HomePage());
                  },
                ))
          ],
        ),
      ),
    );
  }
}
