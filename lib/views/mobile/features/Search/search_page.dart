import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/common/common.dart';
import 'package:flutter_application_1/themes/themes.dart';
import 'package:flutter_application_1/views/mobile/features/features.dart';
import 'package:flutter_application_1/views/mobile/widgets/custom_appbar.dart';
import 'package:flutter_application_1/views/mobile/widgets/mobile_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../controllers/api_controller.dart';
import '../../../../models/models.dart';

class SearchPage extends ConsumerWidget {
  final String query;
  SearchPage({super.key, required this.query});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(podcastProvider(query));
    return Scaffold(
      backgroundColor: LightThemes.backgroundColor,
      endDrawer: const MobileDrawer(),
      appBar: PreferredSize(
        preferredSize: Size(displayWidth(context), 50),
        child: const MobileCustomAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              data.when(
                  error: (e, tr) => Center(
                        child: Text(e.toString()),
                      ),
                  loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                  data: (_data) {
                    List<PodcastModel> collections =
                        _data.map((e) => e).toList();

                    return collections.isNotEmpty
                        ? GridView.builder(
                            itemCount: collections.length,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 10),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 120,
                                      child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (_) =>
                                                                MobilePlayer(
                                                                  name: collections[
                                                                          index]
                                                                      .name,
                                                                  descriptions:
                                                                      collections[
                                                                              index]
                                                                          .description,
                                                                  data: collections[
                                                                          index]
                                                                      .data,
                                                                  cover_pic: collections[
                                                                          index]
                                                                      .coverPic,
                                                                  speaker: collections[
                                                                          index]
                                                                      .speaker,
                                                                )));
                                                  },
                                                  child: Image.network(
                                                    collections[index].coverPic,
                                                    fit: BoxFit.cover,
                                                  )))
                                          .animate()
                                          .flipH(duration: 80.milliseconds),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      collections[index].name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Colors.white,
                                          overflow: TextOverflow.ellipsis),
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              );
                            })
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                  'https://ik.imagekit.io/eztaheq5g/istockphoto-1371555667-612x612-removebg-preview.png?updatedAt=1682257651908',
                                  color: Colors.white,
                                  scale: 1.5,
                                ),
                                const Text(
                                  'Search your favourite podcast',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
