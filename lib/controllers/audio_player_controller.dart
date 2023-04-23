import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

class Controller extends ConsumerStatefulWidget {
  final AudioPlayer audioPlayer;
  final double width;
  const Controller({super.key, required this.audioPlayer,required this.width});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ControllerState();
}

class _ControllerState extends ConsumerState<Controller> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         SizedBox(
          width: widget.width,
        ),
        IconButton(
            iconSize: 50,
            color: Colors.white,
            onPressed: widget.audioPlayer.seekToPrevious,
            icon: const Icon(Icons.skip_previous)),
        StreamBuilder<PlayerState>(
            stream: widget.audioPlayer.playerStateStream,
            builder: (context, snapshot) {
              final playerState = snapshot.data;
              final playing = playerState?.playing;
              final processingState = playerState?.processingState;
              if (!(playing ?? false)) {
                widget.audioPlayer.positionStream == 0
                    ? widget.audioPlayer.play()
                    : null;
                widget.audioPlayer.position.inSeconds == 00
                    ? widget.audioPlayer.play()
                    : null;
                return IconButton(
                    onPressed: widget.audioPlayer.play,
                    iconSize: 50,
                    color: Colors.white,
                    icon: const Icon(Icons.play_circle));
              } else if (processingState != ProcessingState.completed) {
                return IconButton(
                    iconSize: 50,
                    color: Colors.white,
                    onPressed: widget.audioPlayer.pause,
                    icon: const Icon(Icons.pause_circle));
              }
              return IconButton(
                  iconSize: 50,
                  color: Colors.white,
                  onPressed: widget.audioPlayer.pause,
                  icon: const Icon(Icons.play_circle));
            }),
        IconButton(
            iconSize: 50,
            color: Colors.white,
            onPressed: widget.audioPlayer.seekToNext,
            icon: const Icon(Icons.skip_next)),
         SizedBox(
          width: widget.width,
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: 35,
            )),
      ],
    );
  }
}
