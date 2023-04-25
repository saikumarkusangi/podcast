import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/common.dart';
import '../../../../controllers/api_controller.dart';
import '../../../../controllers/hover_controller.dart';
import '../../../../models/models.dart';
import '../../../../themes/themes.dart';
import '../../widgets/appbar.dart';
import '../Player/audioplayer.dart';
import '../collections/collections.dart';

class WebHomePage extends ConsumerWidget {
  const WebHomePage({super.key, required this.query});
  final String query;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(podcastProvider(query));
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
            child: CustomAppBar()),
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
                          data:  (_data) {
                          List<PodcastModel> collections =
                              _data.map((e) => e).toList();

                          return (collections.isEmpty)
                              ? Center(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.network(
                                        'https://ik.imagekit.io/eztaheq5g/istockphoto-1371555667-612x612-removebg-preview.png?updatedAt=1682257651908',
                                        color: Colors.white,
                                        scale: 1.3,
                                      ),
                                      const Text(
                                        'Podcast in pending...',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 42),
                                      ),
                                    ],
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 20),
                                  child: GridView.builder(
                                      itemCount: collections.length,
                                      shrinkWrap: true,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                      ),
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 200,
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: InkWell(
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (_) =>
                                                                      WebPlayer(
                                                                        name: collections[index]
                                                                            .title,
                                                                        descriptions:
                                                                            collections[index].description,
                                                                        data: collections[index]
                                                                            .media,
                                                                        cover_pic:
                                                                            collections[index].coverPic,
                                                                        speaker:
                                                                            collections[index].speaker,
                                                                      )));
                                                        },
                                                        child: Image.network(
                                                          collections[index]
                                                              .coverPic,
                                                          fit: BoxFit.cover,
                                                        ))).animate().flipH(
                                                    duration: 80.milliseconds),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                collections[index].title,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18,
                                                    color: Colors.white,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                                maxLines: 1,
                                              ),
                                            ],
                                          ),
                                        );
                                      }));})
                        ])
        )
      ),
    );
  }
}
