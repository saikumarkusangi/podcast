import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/common.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controllers/button_hover.dart';
import '../features/features.dart';

class MobilAuthWidget extends ConsumerWidget {
  const MobilAuthWidget({super.key});

  @override
  Widget build(BuildContext context,ref) {
       final buttonHover = ref.watch(buttonhoverProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (event) =>
              ref.read(buttonhoverProvider.notifier).hovered(true),
          onExit: (event) =>
              ref.read(buttonhoverProvider.notifier).hovered(false),
          child: InkWell(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => MobileLoginPage())),
            child: Container(
              width: displayWidth(context),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: buttonHover ? 2 : 0,
                  ),
                  borderRadius: BorderRadius.circular(30)),
              child: const Text(
                " Login ",
                 textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: InkWell(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => MobileHomePage())),
            child: Container(
              width: displayWidth(context),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: const Text(
                "Sign Up",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
            ),
          ),
        )
      ],
    );
  }
}
