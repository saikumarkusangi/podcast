import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/common/sizes.dart';
import 'package:flutter_application_1/models/models.dart';
import 'package:flutter_application_1/themes/themes.dart';
import 'package:flutter_application_1/views/mobile/widgets/mobile_drawer.dart';
import 'package:flutter_application_1/views/web/features/collections/collections.dart';
import 'package:flutter_application_1/views/web/features/features.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../controllers/api_controller.dart';
import '../../../web/features/Player/audioplayer.dart';
import '../../widgets/custom_appbar.dart';
import '../features.dart';

class MobileTrendingPage extends ConsumerWidget {
  final String category;
  const MobileTrendingPage(
      {super.key, required this.category});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(podcastProvider(category));
    return Scaffold(
      endDrawer:const MobileDrawer(),
      appBar: PreferredSize(
         preferredSize: Size(displayWidth(context),50),
         child: const MobileCustomAppBar(),),
      backgroundColor: LightThemes.backgroundColor,
      body: SingleChildScrollView(
    
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Trending",style: TextStyle(
                fontSize: 32,fontWeight: FontWeight.bold,
                color: Colors.white
              ),),
            ),
            _data.when(
                error: (e, tr) => Center(
                      child: Text(e.toString()),
                    ),
                loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                data: (_data) {
                  List<PodcastModel> MobileTrendingPage = _data.map((e) => e).toList();
                  
                  return (MobileTrendingPage.isEmpty)
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              horizontal: 10, vertical: 20),
                          child: GridView.builder(
                              itemCount: MobileTrendingPage.length,
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 120,
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: InkWell(
                                                onTap: () {
                                                  MobileTrendingPage[index].type == 'A'?
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (_) =>
                                                              MobilePlayer(
                                                                name: MobileTrendingPage[index].title,
                                                                descriptions: MobileTrendingPage[index].description,
                                                                data: MobileTrendingPage[index].media,
                                                                cover_pic: MobileTrendingPage[index].coverPic,
                                                                speaker: MobileTrendingPage[index].speaker,
                                                               ))):
                                                                Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (_) =>
                                                              WebVideoPlayer(
                                                                name: MobileTrendingPage[index].title,
                                                                descriptions: MobileTrendingPage[index].description,
                                                                data: MobileTrendingPage[index].media,
                                                                cover_pic: MobileTrendingPage[index].coverPic,
                                                                speaker: MobileTrendingPage[index].speaker,
                                                               )));
                                                },
                                                child: Image.network(
                                                  MobileTrendingPage[index].coverPic,
                                                  fit: BoxFit.cover,
                                                ))).animate().flipH(
                                            duration: 80.milliseconds),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        MobileTrendingPage[index].title,
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
                              }));
                })
          ],
        ),
      ),
    );
  }
}
