import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/common.dart';
import 'package:flutter_application_1/views/mobile/features/features.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controllers/auth_controller.dart';
import '../../../controllers/controllers.dart';
import '../features/Trending/trending.dart';

class MobileDrawer extends ConsumerWidget {
  const MobileDrawer({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = ref.watch(currentTabProvider);

    return Drawer(
        backgroundColor: Colors.black,
        width: displayWidth(context),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 32,
                      )),
                ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text( FirebaseAuth.instance.currentUser!.email!.split('@')[0],
                      style:const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),),
                  ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      width: displayWidth(context),
                      height: 50,
                      child: ListTile(
                        minLeadingWidth: 2,
                        leading: const Icon(Icons.search),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: TextFormField(
                            onFieldSubmitted: (value) => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => SearchPage(
                                          query: value,
                                        ))),
                            cursorColor: Colors.black87,
                            style: const TextStyle(fontSize: 18),
                            decoration: const InputDecoration.collapsed(
                                fillColor: Colors.white,
                                hintText: "What do you want to listen?",
                                hintStyle: TextStyle(
                                    color: Colors.black87, fontSize: 17)),
                          ),
                        ),
                      ),
                    ),
                  
                    InkWell(
                      onTap: () {
                              Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const MobileLandingPage()));
                      },
                      child: const Text(
                        'Home',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                              Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>const MobileCategories()));
                      },
                      child: const Text(
                        'Categories',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => MobileTrendingPage(category: 'story',)));
                      },
                      child: const Text(
                        'Trending',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        'Favourites',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        ref.watch(authProvider).delete(context);
                      },
                      child: Container(
                        width: displayWidth(context) * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        child: const Text(
                          'Delete Account',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => ref.watch(authProvider).signOut(context),
                      child: Container(
                        width: displayWidth(context) * 0.8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white, width: 2)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        child: const Text(
                          'Logout',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
