import "dart:async";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:melon/utils/functions.dart";

class Logo extends StatelessWidget {
  const Logo({Key? key, this.logowidth}) : super(key: key);
  final double? logowidth;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: logowidth ?? 60,
        child: Image.asset(
          "assets/images/logo.png",
          width: logowidth ?? 60,
          scale: 2,
        ));
  }
}

abstract class AppColors {
  static const Color primaryColor = Color(0xFFAAD24B);
  static const Color buttonColor = Color(0xFF0B3D48);
  static const Color fadedPrimary = Color(0xFFF9FFEB);
  static const Map<int, Color> primaryMaterialColorSwatch = <int, Color>{
    50: primaryColor,
    900: primaryColor
  };
  static const MaterialColor materialPrimaryColor =
      MaterialColor(0xFFAAD24B, primaryMaterialColorSwatch);
}

class MaterialRadio extends StatefulWidget {
  const MaterialRadio(
      {Key? key,
      this.color,
      this.selectColor,
      this.radius,
      this.onChange,
      this.size,
      this.disenabled})
      : super(key: key);
  final Color? color;
  final Color? selectColor;
  final double? size, radius;
  final bool? disenabled;
  final void Function(bool)? onChange;
  @override
  MaterialRadioState createState() => MaterialRadioState();
}

class MaterialRadioState extends State<MaterialRadio> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    if (widget.disenabled != null) {
      selected = true;
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          if (widget.disenabled == null || (widget.disenabled == false)) {
            selected ? selected = false : selected = true;
          }
          if (widget.onChange != null) widget.onChange!(selected);
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: widget.size ?? 25,
            height: widget.size ?? 25,
            decoration: BoxDecoration(
                color: widget.color ?? Colors.blueAccent,
                borderRadius: BorderRadius.circular(
                  widget.radius ?? 20,
                )),
          ),
          if (selected)
            Container(
              width: widget.size != null ? widget.size! / 2 : 12.5,
              height: widget.size != null ? widget.size! / 2 : 12.5,
              decoration: BoxDecoration(
                  color: widget.selectColor ?? Colors.white,
                  borderRadius: BorderRadius.circular(
                    widget.radius ?? 30,
                  )),
            ),
        ],
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  const AppButton(this.text,
      {Key? key, required this.onPressed, this.disenabled})
      : super(key: key);
  final VoidCallback? onPressed;
  final String text;
  final bool? disenabled;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        height: 52,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: width(context),
        color: disenabled != null && disenabled == true
            ? AppColors.buttonColor.withOpacity(.3)
            : AppColors.buttonColor,
        child: Text(text,
            style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w700,
                color: Colors.white)),
      ),
    );
  }
}

Widget header(BuildContext context, String title) {
  return Container(
    margin: const EdgeInsets.only(top: 27, left: 20),
    child: TextButton(
        onPressed: () => pop(context),
        child: Row(
          children: <Widget>[
            const Icon(
              Icons.arrow_back_ios,
              color: AppColors.buttonColor,
            ),
            const Text("Back"),
            Container(
              margin: const EdgeInsets.only(left: 57),
              child: Text(
                title,
                style: const TextStyle(
                    color: AppColors.buttonColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            )
          ],
        )),
  );
}

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {required this.label,
      this.controller,
      this.prefix,
      this.suffix,
      this.hint,
      this.onTap,
      this.readOnly,
      this.textCapitalization, this.textInputType});
  final String label;
  final TextEditingController? controller;
  final Widget? suffix;
  final Widget? prefix;
  final String? hint;
  final bool? readOnly;
  final GestureTapCallback? onTap;
  final TextCapitalization? textCapitalization;
  final TextInputType? textInputType;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width(context),
          child: Text(label),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: TextFormField(
            readOnly: readOnly ?? false,
            controller: controller,
            onTap: onTap,
            textCapitalization: textCapitalization ?? TextCapitalization.words,
            keyboardType: textInputType,
            decoration: InputDecoration(
                hintText: hint,
                hintStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                suffixStyle: const TextStyle(color: AppColors.primaryColor),
                prefixStyle: const TextStyle(color: AppColors.primaryColor),
                prefixIcon: prefix,
                suffixIcon: suffix),
          ),
        )
      ],
    );
  }
}

class CountDown extends StatefulWidget {
  const CountDown({Key? key, this.style, required this.duration})
      : super(key: key);
  final TextStyle? style;
  final int duration;
  @override
  CountDownState createState() => CountDownState();
}

class CountDownState extends State<CountDown> {
  late int interval;
  String time = "";
  late Timer timer;

  @override
  void initState() {
    interval = widget.duration;
    timer = Timer.periodic(const Duration(seconds: 1), (Timer ti) {
      interval -= 1;
      final double minutes = interval / 60;
      int seconds = interval % 60;
      seconds > 0 ? seconds -= 1 : seconds = 0;
      if (interval > 0) {
        setState(() {
          time = "${minutes.toInt()}:$seconds";
        });
      } else {
        timer.cancel();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      time,
      style: widget.style,
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton(
      {required this.header,
      required this.icon,
      this.description,
      required this.route});
  final String header;
  final String? description;
  final IconData icon;
  final Widget route;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.fadedPrimary,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 30)
            .add(const EdgeInsets.only(top: 10)),
        child: TextButton(
          onPressed: () => push(context, route),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon,
                color: AppColors.primaryColor,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: width(context) / 2,
                child: Column(
                  children: [
                    Container(
                        width: (width(context) / 2) - 5,
                        child: Text(
                          header,
                          style: const TextStyle(fontSize: 22),
                        )),
                    if (description != null)
                      Container(
                          width: (width(context) / 2) - 5,
                          child: Text(
                            description!,
                            style: const TextStyle(fontSize: 11),
                          ))
                  ],
                ),
              ),
              const RotatedBox(
                  quarterTurns: 2,
                  child:
                      Icon(Icons.arrow_back_ios, color: AppColors.primaryColor))
            ],
          ),
        ));
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({required this.message, required this.page});
  final Widget page;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: EdgeInsets.only(top: height(context) / 3),
                  child: Text(
                    message,
                    style: const TextStyle(fontSize: 20),
                  )),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30)
                    .add(const EdgeInsets.only(bottom: 30)),
                child: AppButton("Try again",
                    onPressed: () => push(context, page)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
