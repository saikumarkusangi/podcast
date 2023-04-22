import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/common.dart';
import '../../../../controllers/api_controller.dart';
import '../../../../controllers/hover_controller.dart';
import '../../../../themes/themes.dart';
import '../../widgets/widgets.dart';

class WebCategories extends ConsumerWidget {
  const WebCategories({super.key});
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
        appBar: PreferredSize(
            preferredSize: Size(displayWidth(context), 60),
            child: const CustomAppBar()),
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
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: GridView.builder(
                          itemCount: collections.length,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3, childAspectRatio: 1.5),
                          itemBuilder: (context, index) {
                            String color = "0xFF${collections[index].color}";
                            return SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(int.parse(color)),
                                      ),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 20,
                                            top: 20,
                                            child: SizedBox(
                                              width: displayWidth(context) * 0.16,
                                              child: Text(
                                                collections[index].name,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 28,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            right: -50,
                                            bottom: -30,
                                            child: RotationTransition(
                                                turns:
                                                    const AlwaysStoppedAnimation(
                                                        20 / 360),
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    child: Container(
                                                      color: Colors.red,
                                                      width: displayWidth(
                                                              context) *
                                                          0.18,
                                                          height: 200,
                                                      child: Image.network(
                                                        collections[index].image,
                                                                 fit: BoxFit.cover,                                     
                                                      ),
                                                    ))),
                                          )
                                        ],
                                      ),
                                    )),
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
