import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/common.dart';
import 'package:flutter_application_1/themes/themes.dart';
import 'package:flutter_application_1/views/web/features/Trending/trending.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../controllers/controllers.dart';
import '../features/features.dart';

class CustomAppBar extends ConsumerWidget {
  CustomAppBar({super.key});
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ishover = ref.watch(hoverProvider);
    final currentTab = ref.watch(currentTabProvider);
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
              'https://ik.imagekit.io/eztaheq5g/490-4901480_podcastlogo-logo-image-podcast-png-transparent-png-removebg-preview.png?updatedAt=1682135735565',
              color: Colors.white,
              width: displayWidth(context) / 6),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (event) => ref.read(hoverProvider.notifier).hovered(0),
            onExit: (event) =>
                ref.read(hoverProvider.notifier).hovered(currentTab),
            child: InkWell(
              onTap: () {
                ref.read(currentTabProvider.notifier).tab(0);
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const WebLandingPage()));
              },
              child: Text(
                "Home",
                style: TextStyle(
                  color: currentTab == 0 || ishover == 0
                      ? LightThemes.headingtextColor
                      : LightThemes.subtextColor,
                  fontSize: currentTab == 0 || ishover == 0 ? 20 : 14,
                ),
              ),
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (event) => ref.read(hoverProvider.notifier).hovered(1),
            onExit: (event) =>
                ref.read(hoverProvider.notifier).hovered(currentTab),
            child: InkWell(
              onTap: () {
                ref.read(currentTabProvider.notifier).tab(1);
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const WebCategories()));
              },
              child: Text(
                "Categories",
                style: TextStyle(
                  color: currentTab == 1 || ishover == 1
                      ? LightThemes.headingtextColor
                      : LightThemes.subtextColor,
                  fontSize: currentTab == 1 || ishover == 1 ? 20 : 14,
                ),
              ),
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (event) => ref.read(hoverProvider.notifier).hovered(2),
            onExit: (event) =>
                ref.read(hoverProvider.notifier).hovered(currentTab),
            child: InkWell(
              onTap: () {
                ref.read(currentTabProvider.notifier).tab(2);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => WebTrendingPage(category: 'story')));
              },
              child: Text(
                "Trending",
                style: TextStyle(
                  color: currentTab == 2 || ishover == 2
                      ? LightThemes.headingtextColor
                      : LightThemes.subtextColor,
                  fontSize: currentTab == 2 || ishover == 2 ? 20 : 14,
                ),
              ),
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (event) => ref.read(hoverProvider.notifier).hovered(3),
            onExit: (event) =>
                ref.read(hoverProvider.notifier).hovered(currentTab),
            child: InkWell(
              onTap: () {
                ref.read(currentTabProvider.notifier).tab(3);
              },
              child: Text(
                "Favourites",
                style: TextStyle(
                  color: currentTab == 3 || ishover == 3
                      ? LightThemes.headingtextColor
                      : LightThemes.subtextColor,
                  fontSize: currentTab == 3 || ishover == 3 ? 20 : 14,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            width: displayWidth(context) / 4,
            height: 50,
            child: ListTile(
              minLeadingWidth: 2,
              leading: const Icon(Icons.search),
              title: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: TextFormField(
                  onFieldSubmitted: (value) => (value.isNotEmpty)
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => WebHomePage(
                                    query: searchController.text,
                                  )))
                      : null,
                  controller: searchController,
                  cursorColor: Colors.black87,
                  style: const TextStyle(fontSize: 18),
                  decoration: const InputDecoration.collapsed(
                      fillColor: Colors.white,
                      hintText: "What do you want to listen?",
                      hintStyle:
                          TextStyle(color: Colors.black87, fontSize: 17)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: InkWell(
                onTap: () {
                  ref.read(hoverProvider.notifier).hovered(4);
                },
                child: const Icon(
                  Icons.person,
                  size: 36,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
