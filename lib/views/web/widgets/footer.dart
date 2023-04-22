import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/common.dart';

class WebFooter extends StatelessWidget {
  const WebFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(" © Created by sai kumar kusangi and sravika malipeddi",style: TextStyle(
      color: Colors.white,
      fontSize: 12
    ),
    textAlign: TextAlign.center,
    );
  }
}