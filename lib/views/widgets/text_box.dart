import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final double fontSize;
  final String label, fontFamily;
  final Color color, fontColor;
  final FontWeight fontWeight;
  final TextEditingController controller;

  const TextBox(
      {Key? key,
      required this.controller,
      required this.label,
      this.color = Colors.black,
      this.fontColor = Colors.white,
      this.fontFamily = 'Poppins',
      this.fontSize = 13,
      this.fontWeight = FontWeight.w700})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        alignLabelWithHint: true,
        // hintText: 'Enter Your Password',
        // hintStyle: TextStyle(
        //   fontFamily: 'Poppins',
        //   fontSize: 10,
        //   fontWeight: FontWeight.w400,
        // ),
        labelText: label,
        labelStyle: const TextStyle(
          fontFamily: 'Popppins',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
    );
  }
}
