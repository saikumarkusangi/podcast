import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/common/sizes.dart';
import 'package:flutter_application_1/models/models.dart';
import 'package:flutter_application_1/themes/themes.dart';
import 'package:flutter_application_1/views/mobile/features/details/details.dart';
import 'package:flutter_application_1/views/web/features/collections/collections.dart';
import 'package:flutter_application_1/views/web/features/features.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../controllers/api_controller.dart';
import '../../../web/features/Player/audioplayer.dart';
import '../features.dart';

class MobileCollections extends ConsumerWidget {
  final String background;
  final String category;
  const MobileCollections(
      {super.key, required this.background, required this.category});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(podcastProvider(category));
    return Scaffold(
      backgroundColor: LightThemes.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.white70, Colors.black54],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(1, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
              width: displayWidth(context),
              height: displayHeight(context) / 4,
              child: Stack(children: [
                Positioned(
                    left: 85,
                    top: 10,
                    //  https://www.spiritshunters.com/wp-content/uploads/2018/06/vinyle-blanc.gif
                    child: Image.network(
                      'https://ik.imagekit.io/eztaheq5g/186-1868279_disc-record-retro-vinyl-audio-sound-music-retro-removebg-preview.png?updatedAt=1682192919269',
                      width: 100,
                    )).animate().moveX(begin: -100, delay: 200.milliseconds),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: displayWidth(context) * 0.3,
                      height: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(background),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    category,
                    style: const TextStyle(
                        color: Colors.white,
                        shadows: [
                          Shadow(
                              color: Colors.white24,
                              blurRadius: 10,
                              offset: Offset(13, 10))
                        ],
                        fontWeight: FontWeight.w700,
                        fontSize: 32),
                  ),
                ),
                //  Image.network('https://media0.giphy.com/media/TDlSjxwwM7WYqNf3fh/giphy.gif')
              ]),
            ),
            _data.when(
                error: (e, tr) => Center(
                      child: Text(e.toString()),
                    ),
                loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                data: (_data) {
                  List<PodcastModel> MobileCollections =
                      _data.map((e) => e).toList();
                    List channels = [];
                  List cover = [];
                  for (var item in MobileCollections) {
                    print(item.channel);
                    if (channels.contains(item.channel)) {
                    } else {
                      channels.add(item.channel);
                      cover.add(item.coverPic);
                    }

                  }
                  return (MobileCollections.isEmpty)
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
                              itemCount: channels.length,
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
                                                      Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (_) =>
                                                                      MobileDetails(
                                                                       cover_pic:cover[index],
                                                                       channel: channels[index],
                                                                      )));
                                                    },
                                                    child: Image.network(
                                                      cover[index]
                                                        ,
                                                      fit: BoxFit.cover,
                                                    )))
                                            .animate()
                                            .flipH(duration: 80.milliseconds),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        channels[index],
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
