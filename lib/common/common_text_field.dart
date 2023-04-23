import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/common.dart';

class CommonTextField extends StatelessWidget {
  final String hintText;
  final bool ispass;
  final TextEditingController controller;
  final TextInputType type;
  final Color borderside;
  final double width;
  final Color color;
  final double padding;
  const CommonTextField(
      {super.key,
      required this.controller,
      required this.borderside,
      required this.type,
      required this.hintText,
      required this.color,
      required this.width,
      required this.padding,
      required this.ispass});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: padding),
      child: SizedBox(
        height: 50,
        child: Center(
          child: TextFormField(
            controller: controller,
            obscureText: ispass,
            keyboardType: type,
            style: TextStyle(fontSize: 22, color: color),
            cursorColor: color,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderside, width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: color, width: 2)),
                hintText: hintText,
                hintStyle: TextStyle(fontSize: 22, color: color.withOpacity(0.5))),
          ),
        ),
      ),
    );
  }
}
