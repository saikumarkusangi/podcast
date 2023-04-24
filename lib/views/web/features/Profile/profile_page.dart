import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../controllers/auth_controller.dart';
import '../../../../controllers/hover_controller.dart';

class WebProfile extends ConsumerWidget {
  const WebProfile({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = ref.watch(currentTabProvider);
    return Container(
      height: 150,
      width: 150,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: InkWell(
              onTap: () {},
              child:  Text(
                FirebaseAuth.instance.currentUser!.email!.split('@')[0],
                style:const TextStyle(fontSize: 18),
              ),
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: InkWell(
              onTap: () {},
              child: const Text(
                'Delete Account',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: InkWell(
              onTap: () {
                ref.read(hoverProvider.notifier).hovered(currentTab);
                ref.watch(authProvider).signOut(context);

              },
              child: const SizedBox(
                width: 100,
                child: Text(
                  'Logout',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
