import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/common/sizes.dart';
import 'package:flutter_application_1/models/models.dart';
import 'package:flutter_application_1/themes/themes.dart';
import 'package:flutter_application_1/views/web/widgets/appbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../controllers/api_controller.dart';
import '../../../../controllers/auth_controller.dart';
import '../../../../controllers/hover_controller.dart';
import '../Profile/profile_page.dart';
import '../features.dart';

class WebTrendingPage extends ConsumerWidget {
  final String category;
  const WebTrendingPage(
      {super.key, required this.category});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(podcastProvider(category));
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
                child: ref.watch(authStateChangeProvider).when(
                    loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                    error: (e, tr) => Center(
                          child: Text(e.toString()),
                        ),
                    data: (user) {
                      if (user != null) {
                        return  CustomAppBar()
                            .animate()
                            .fadeIn(delay: 500.ms);
                      }
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Image.network(
                              'https://ik.imagekit.io/eztaheq5g/490-4901480_podcastlogo-logo-image-podcast-png-transparent-png-removebg-preview.png?updatedAt=1682135735565',
                              color: Colors.white,
                              width: displayWidth(context) / 6),
                        ),
                      );
                    })),
        body: SingleChildScrollView(
          child: Stack(
            children: 
              [
                 
                Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                        const Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 60,vertical: 20),
                    child: Text("Trending",style: TextStyle(
                      fontSize: 42,fontWeight: FontWeight.bold,
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
                        List<PodcastModel> WebTrendingPage = _data.map((e) => e).toList();
                
                        return (WebTrendingPage.isEmpty)
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
                                    horizontal: 40, vertical: 20),
                                child: GridView.builder(
                                    itemCount: WebTrendingPage.length,
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
                                                      BorderRadius.circular(10),
                                                  child: InkWell(
                                                      onTap: () {
                                                        WebTrendingPage[index].type == 'A'
                                                            ? Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (_) =>
                                                                            WebPlayer(
                                                                              name: WebTrendingPage[index]
                                                                                  .name,
                                                                              descriptions:
                                                                                  WebTrendingPage[index].description,
                                                                              data: WebTrendingPage[index]
                                                                                  .data,
                                                                              cover_pic:
                                                                                  WebTrendingPage[index].coverPic,
                                                                              speaker:
                                                                                  WebTrendingPage[index].speaker,
                                                                            )))
                                                            : Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (_) =>
                                                                            WebVideoPlayer(
                                                                              name: WebTrendingPage[index]
                                                                                  .name,
                                                                              descriptions:
                                                                                  WebTrendingPage[index].description,
                                                                              data: WebTrendingPage[index]
                                                                                  .data,
                                                                              cover_pic:
                                                                                  WebTrendingPage[index].coverPic,
                                                                              speaker:
                                                                                  WebTrendingPage[index].speaker,
                                                                            )));
                                                      },
                                                      child: Image.network(
                                                        WebTrendingPage[index].coverPic,
                                                        fit: BoxFit.cover,
                                                      ))).animate().flipH(
                                                  duration: 80.milliseconds),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              WebTrendingPage[index].name,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18,
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
               ishover == 4
                      ? const Positioned(top: 0, right: 0, child: WebProfile())
                      : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
