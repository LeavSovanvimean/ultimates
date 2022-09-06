import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final double height, width, borderRadius, borderWidth, fontSize;
  final String label, fontFamily;
  final Color color, borderColor, fontColor, splashColor;
  final FontWeight fontWeight;
  final Function? onTap;
  // Color(0xff585858) ,Color(0xffE3E3E3),

  const Button(
      {Key? key,
      required this.label,
      this.onTap,
      this.height = 42,
      this.width = 130,
      this.borderRadius = 28,
      this.color = Colors.black,
      this.splashColor = const Color(0xff585858),
      this.borderWidth = 0,
      this.borderColor = Colors.transparent,
      this.fontColor = Colors.white,
      this.fontFamily = 'Poppins',
      this.fontSize = 13,
      this.fontWeight = FontWeight.w700})
      : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: widget.color,
        border:
            Border.all(width: widget.borderWidth, color: widget.borderColor),
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => widget.onTap!(),
          borderRadius: BorderRadius.circular(widget.borderRadius),
          splashColor: widget.splashColor,
          splashFactory: InkRipple.splashFactory,
          child: Center(
              child: Text(
            widget.label,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: widget.fontFamily,
                fontSize: widget.fontSize,
                fontWeight: widget.fontWeight,
                color: widget.fontColor),
          )),
        ),
      ),
    );
  }
}
