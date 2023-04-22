import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/common.dart';

class CommonTextField extends StatelessWidget {
  final String hintText;
  final bool ispass;
  final TextEditingController controller;
  final TextInputType type;
  const CommonTextField(
      {super.key,
      required this.controller,
      required this.type,
      required this.hintText,
      required this.ispass});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: displayWidth(context) / 4,
      height: 50,
      child: Center(
        child: TextFormField(
          controller: controller,
          obscureText: ispass,
          keyboardType: type,
          style: const TextStyle(fontSize: 22),
          cursorColor: Colors.black,
          decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black45, width: 2)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2)),
              hintText: hintText,
              hintStyle: const TextStyle(fontSize: 22)),
        ),
      ),
    );
  }
}
