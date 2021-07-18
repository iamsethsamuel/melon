import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:melon/utils/functions.dart';

class Logo extends StatelessWidget {
  Logo({Key? key, this.logowidth}) : super(key: key);
  final double? logowidth;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: logowidth ?? width(context),
        child: Image.asset("assets/images/logo.png"));
  }
}

abstract class AppColors {
  static Color primaryColor = Color(0xFFAAD24B);
  static Color buttonColor = Color(0xFF0B3D48);
  // static const Acce = MaterialAccentColor();
}

class MaterialRadio extends StatefulWidget {
  MaterialRadio(
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
  MaterialRadioState createState() => MaterialRadioState();
}

class MaterialRadioState extends State<MaterialRadio> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    if (widget.disenabled!=null) {
      selected = true;
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          if(widget.disenabled!=null) selected ? selected = false : selected = true;
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
  AppButton(this.text, {Key? key, required this.onPressed}) : super(key: key);
  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: width(context),
      child: ElevatedButton(
        child: Text(this.text,
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700)),
        onPressed: this.onPressed,
      ),
    );
  }
}
