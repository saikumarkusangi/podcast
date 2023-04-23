import 'package:flutter/material.dart';

import '../../../common/common.dart';

class MobileCustomAppBar extends StatelessWidget {
  const MobileCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(size: 32, color: Colors.white),
      automaticallyImplyLeading: false,
      leadingWidth: displayWidth(context) * 0.4,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Image.network(
          'https://ik.imagekit.io/eztaheq5g/490-4901480_podcastlogo-logo-image-podcast-png-transparent-png-removebg-preview.png?updatedAt=1682135735565',
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
