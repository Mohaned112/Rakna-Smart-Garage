import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      required this.hintText,
      required this.leftPadding,
      required this.rightPadding,
      required this.bottomPadding,
      required this.topPadding,
       required this.controller

      })
      : super(key: key);

  late double leftPadding;
  late double rightPadding;
  late double bottomPadding;
  late double topPadding;
  late String hintText;
  late TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: bottomPadding,
        top: topPadding,
        left: leftPadding,
        right: rightPadding,
      ),
      child: TextFormField(
        controller: controller,

        decoration: InputDecoration(
            hintText: hintText,
            fillColor: Colors.grey[200],
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none)),
      ),
    );
  }
}
