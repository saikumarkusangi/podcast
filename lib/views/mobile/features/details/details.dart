import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/common/sizes.dart';
import 'package:flutter_application_1/models/models.dart';
import 'package:flutter_application_1/themes/themes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../controllers/api_controller.dart';
import '../../../web/features/Player/videoplayer.dart';
import '../features.dart';

class MobileDetails extends ConsumerWidget {
  final String cover_pic;
  final String channel;
  const MobileDetails(
      {super.key, required this.channel, required this.cover_pic});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(podcastProvider(channel));
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
                              image: NetworkImage(cover_pic),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    channel,
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
                  List<PodcastModel> MobileDetails = _data.map((e) {
                    return e;
                  }).toList();

                 

                  return (MobileDetails.isEmpty)
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
                              horizontal: 5, vertical: 20),
                          child: ListView.builder(
                              itemCount: MobileDetails.length,
                              shrinkWrap: true,
                            
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: (){
                                      MobileDetails[index].type == 'V' ?
                                                      Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (_) =>
                                                                      WebVideoPlayer(
                                                                        name: MobileDetails[index]
                                                                            .title,
                                                                        descriptions:
                                                                            MobileDetails[index].description,
                                                                        data: MobileDetails[index]
                                                                            .media,
                                                                        cover_pic:
                                                                            MobileDetails[index].coverPic,
                                                                        speaker:
                                                                            MobileDetails[index].speaker,
                                                                      ))):
                                                      Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (_) =>
                                                                      MobilePlayer(
                                                                        name: MobileDetails[index]
                                                                            .title,
                                                                        descriptions:
                                                                            MobileDetails[index].description,
                                                                        data: MobileDetails[index]
                                                                            .media,
                                                                        cover_pic:
                                                                            MobileDetails[index].coverPic,
                                                                        speaker:
                                                                            MobileDetails[index].speaker,
                                                                      )));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2, vertical: 10),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: 100,
                                          child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.network(
                                                    MobileDetails[index].coverPic,
                                                    fit: BoxFit.cover,
                                                  ))
                                              .animate()
                                              .flipH(duration: 80.milliseconds),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                MobileDetails[index].title,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 22,
                                                    color: Colors.white,
                                                    overflow: TextOverflow.ellipsis),
                                                maxLines: 1,
                                              ),
                                              const SizedBox(height: 5,),
                                              Text( 
                                                MobileDetails[index].description,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white70,
                                                    overflow: TextOverflow.ellipsis),
                                                maxLines: 3,
                                              ),
                                               const SizedBox(height: 5,),
                                              Text( 
                                                'Speaker : ${MobileDetails[index].speaker}',
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white70,
                                                    overflow: TextOverflow.ellipsis),
                                                maxLines: 3,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
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
