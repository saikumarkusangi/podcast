import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/common.dart';
import 'package:flutter_application_1/controllers/controllers.dart';
import 'package:flutter_application_1/models/models.dart';
import 'package:flutter_application_1/themes/themes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:rxdart/rxdart.dart';

class MobilePlayer extends ConsumerStatefulWidget {
  final String data;
  final String cover_pic;
  final String name;
  final String descriptions;
  final String speaker;
  const MobilePlayer(
      {super.key,
      required this.data,
      required this.cover_pic,
      required this.name,
      required this.descriptions,
      required this.speaker});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MobilePlayerState();
}

class _MobilePlayerState extends ConsumerState<MobilePlayer> {
  late AudioPlayer _audioPlayer;

  // final _playlist = ConcatenatingAudioSource(children: [
  //   AudioSource.uri(
  //       Uri.parse(
  //           'https://podcast.saikumar150.repl.co/files/data/better_business_101_raising_the_minimum_wage.mp3'),
  //       tag: 'Song 1'),
  //   AudioSource.uri(
  //       Uri.parse(
  //           'https://podcast.saikumar150.repl.co/files/data/Inferno_Canto_3_-_The_Neutral_Angels0A.mp3'),
  //       tag: 'Song 2'),
  // ]);

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          _audioPlayer.positionStream,
          _audioPlayer.bufferedPositionStream,
          _audioPlayer.durationStream,
          (position, bufferPosition, duration) => PositionData(
              position, bufferPosition, duration ?? Duration.zero));

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer()..setUrl(widget.data);
    // _init();
  }

  // Future<void> _init() async {
  //   await _audioPlayer.setLoopMode(LoopMode.all);
  //   await _audioPlayer.setAudioSource(_playlist);
  // }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightThemes.backgroundColor,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(widget.cover_pic), fit: BoxFit.cover)),
        width: displayWidth(context),
        height: displayHeight(context),
        child: BackdropFilter(
          blendMode: BlendMode.darken,
          filter: ImageFilter.blur(sigmaX: 500, sigmaY: 500),
          child: Container(
            color: Colors.black45,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    height: displayHeight(context)/2,
                    child: Image.network(
                      widget.cover_pic,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: displayWidth(context) ,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                            color: Colors.white,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                      Text(
                        widget.speaker,
                        style:
                            const TextStyle(fontSize: 22, color: Colors.white),
                      ),
                          const SizedBox(height: 20,),
                      StreamBuilder<PositionData>(
                          stream: _positionDataStream,
                          builder: (context, snapshot) {
                            final positionData = snapshot.data;
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: ProgressBar(
                                barHeight: 8,
                                baseBarColor: Colors.white,
                                bufferedBarColor: Colors.grey,
                                progressBarColor: Colors.red,
                                thumbColor: Colors.red,
                                barCapShape: BarCapShape.square,
                                timeLabelTextStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                                progress:
                                    positionData?.position ?? Duration.zero,
                                total: positionData?.duration ?? Duration.zero,
                                buffered: positionData?.bufferPosition ??
                                    Duration.zero,
                                onSeek: _audioPlayer.seek,
                              ),
                            );
                          }),
                          const SizedBox(height: 10,),
                      Controller(audioPlayer: _audioPlayer,width: 10,),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
