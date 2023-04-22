import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget web;
  const Responsive({super.key, required this.web, required this.mobile});

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 880) {
          return web;
        } else {
          return mobile;
        }
      },
    );
  }
}
