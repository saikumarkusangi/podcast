import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/common/sizes.dart';
import 'package:flutter_application_1/models/models.dart';
import 'package:flutter_application_1/themes/themes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../controllers/api_controller.dart';
import '../features.dart';

class webDetails extends ConsumerWidget {
  final String cover_pic;
  final String channel;
  const webDetails(
      {super.key, required this.channel, required this.cover_pic});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(podcastProvider(channel));
    return Scaffold(
      backgroundColor: LightThemes.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.white70, Colors.black54],
                      begin: FractionalOffset(0.0, 0.0),
                      end: FractionalOffset(0.5, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                width: displayWidth(context),
                height: displayHeight(context) / 3,
                child: Stack(children: [
                  Positioned(
                      left: 85,

                      //  https://www.spiritshunters.com/wp-content/uploads/2018/06/vinyle-blanc.gif
                      child: Image.network(
                        'https://ik.imagekit.io/eztaheq5g/186-1868279_disc-record-retro-vinyl-audio-sound-music-retro-removebg-preview.png?updatedAt=1682192919269',
                        width: 200,
                      )).animate().moveX(begin: -100, delay: 200.milliseconds),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: displayWidth(context) * 0.15,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(cover_pic),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
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
                          fontSize: 62),
                    ),
                  ),
                  //  Image.network('https://media0.giphy.com/media/TDlSjxwwM7WYqNf3fh/giphy.gif')
                ]),
              ),
            ),
            _data.when(
                error: (e, tr) => Center(
                      child: Text(e.toString()),
                    ),
                loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                data: (_data) {
                  List<PodcastModel> webDetails = _data.map((e) {
                    return e;
                  }).toList();

                 

                  return (webDetails.isEmpty)
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
                          child: ListView.builder(
                              itemCount: webDetails.length,
                              shrinkWrap: true,
                            
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: (){
                                      webDetails[index].type == 'V' ?
                                                      Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (_) =>
                                                                      WebVideoPlayer(
                                                                        name: webDetails[index]
                                                                            .title,
                                                                        descriptions:
                                                                            webDetails[index].description,
                                                                        data: webDetails[index]
                                                                            .media,
                                                                        cover_pic:
                                                                            webDetails[index].coverPic,
                                                                        speaker:
                                                                            webDetails[index].speaker,
                                                                      ))):
                                                      Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (_) =>
                                                                      WebPlayer(
                                                                        name: webDetails[index]
                                                                            .title,
                                                                        descriptions:
                                                                            webDetails[index].description,
                                                                        data: webDetails[index]
                                                                            .media,
                                                                        cover_pic:
                                                                            webDetails[index].coverPic,
                                                                        speaker:
                                                                            webDetails[index].speaker,
                                                                      )));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: 200,
                                          child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.network(
                                                    webDetails[index].coverPic,
                                                    fit: BoxFit.cover,
                                                  ))
                                              .animate()
                                              .flipH(duration: 80.milliseconds),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                webDetails[index].title,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 28,
                                                    color: Colors.white,
                                                    overflow: TextOverflow.ellipsis),
                                                maxLines: 1,
                                              ),
                                              const SizedBox(height: 20,),
                                              Text( 
                                                webDetails[index].description,
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white70,
                                                    overflow: TextOverflow.ellipsis),
                                                maxLines: 3,
                                              ),
                                               const SizedBox(height: 20,),
                                              Text( 
                                                'Speaker : ${webDetails[index].speaker}',
                                                style: const TextStyle(
                                                    fontSize: 20,
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
