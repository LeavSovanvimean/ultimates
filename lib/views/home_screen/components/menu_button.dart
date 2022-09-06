import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuButton extends StatefulWidget {
  final Function? onTap;
  final String icon;
  final String title;
  const MenuButton({
    Key? key,
    this.onTap,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 85,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(0, 5),
              spreadRadius: 0,
              blurRadius: 25)
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => widget.onTap!(),
          borderRadius: BorderRadius.circular(15),
          splashColor: Colors.grey.shade200,
          splashFactory: InkRipple.splashFactory,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          offset: const Offset(1, 4),
                          spreadRadius: 0,
                          blurRadius: 8)
                    ],
                  ),
                  alignment: Alignment.center,
                  child: SvgPicture.asset(widget.icon,)),
              Text(
                widget.title,
                style: const TextStyle(
                    fontFamily: 'Poppins', fontSize: 12, color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
