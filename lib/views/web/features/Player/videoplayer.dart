import 'dart:ui';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/common.dart';
import 'package:flutter_application_1/controllers/controllers.dart';
import 'package:flutter_application_1/models/models.dart';
import 'package:flutter_application_1/themes/themes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:rxdart/rxdart.dart';
import 'package:video_player/video_player.dart';

class WebVideoPlayer extends ConsumerStatefulWidget {
  final String data;
  final String cover_pic;
  final String name;
  final String descriptions;
  final String speaker;
  const WebVideoPlayer(
      {super.key,
      required this.data,
      required this.cover_pic,
      required this.name,
      required this.descriptions,
      required this.speaker});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WebVideoPlayerState();
}

class _WebVideoPlayerState extends ConsumerState<WebVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network('http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4');
    _chewieController = ChewieController(
        autoPlay: true,
        allowFullScreen: false,
        showControlsOnInitialize: false,
        videoPlayerController: _videoPlayerController,
        aspectRatio: 2);
  }

  // Future<void> _init() async {
  //   await _audioPlayer.setLoopMode(LoopMode.all);
  //   await _audioPlayer.setAudioSource(_playlist);
  // }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
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
                child: Stack(
                  children: [
                    Container(
                        width: displayWidth(context),
                        color: Colors.black45,
                        child: Chewie(controller: _chewieController)),
                    Positioned(
                      bottom: displayHeight(context)/8,left: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          Text(widget.name,style:const TextStyle(fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),),
                         Text(widget.speaker,
                         style: const TextStyle(
                          color: Colors.white60,
                          fontSize: 18,
                          
                         ),
                        )],
                      ),
                    )
                  ],
                ))));
  }
}
