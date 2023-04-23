import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/models/models.dart';
import 'package:flutter_application_1/views/mobile/features/collections/collections_page.dart';
import 'package:flutter_application_1/views/web/features/collections/collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/common.dart';
import '../../../../controllers/api_controller.dart';
import '../../../../controllers/hover_controller.dart';
import '../../../../themes/themes.dart';
import '../../widgets/widgets.dart';

class MobileCategories extends ConsumerWidget {
  const MobileCategories({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(collectionsProvider);
    final ishover = ref.watch(hoverProvider);
    final currentTab = ref.watch(currentTabProvider);
    return GestureDetector(
      onTap: () => ishover == 4
          ? ref.watch(hoverProvider.notifier).hovered(currentTab)
          : null,
      child: Scaffold(
        backgroundColor: LightThemes.backgroundColor,
        endDrawer:const MobileDrawer(),
           appBar: PreferredSize(
            preferredSize: Size(displayWidth(context), 50),
            child:const  MobileCustomAppBar()),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _data.when(
                  error: (e, tr) => Center(
                        child: Text(e.toString()),
                      ),
                  loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                  data: (_data) {
                    List<CatergoriesModel> collections =
                        _data.map((e) => e).toList();
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                      child: GridView.builder(
                          itemCount: collections.length,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 1.5),
                          itemBuilder: (context, index) {
                            String color = "0xFF${collections[index].color}";
                            return SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 10),
                                child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Color(int.parse(color)),
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          MobileCollections(
                                                            category: collections[index].name,
                                                              background:
                                                                  collections[
                                                                          index]
                                                                      .image)));
                                            },
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  left: 5,
                                                  top: 5,
                                                  child: SizedBox(
                                                    width:
                                                        displayWidth(context) *
                                                            0.3,
                                                    child: Text(
                                                      collections[index].name,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 16,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  right: -8,
                                                  bottom: -3,
                                                  child: RotationTransition(
                                                      turns:
                                                          const AlwaysStoppedAnimation(
                                                              20 / 360),
                                                      child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          child: Container(
                                                            color: Colors.red,
                                                            width: displayWidth(
                                                                    context) *
                                                                0.18,
                                                            height: 70,
                                                            child:
                                                                Image.network(
                                                              collections[index]
                                                                  .image,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ))),
                                                )
                                              ],
                                            ),
                                          ),
                                        ))
                                    .animate()
                                    .flipH(duration: 80.milliseconds),
                              ),
                            );
                          }),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
