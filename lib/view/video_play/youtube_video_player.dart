import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeVideoPlayer extends StatefulWidget {
  final String videoId;

  const YouTubeVideoPlayer({super.key, required this.videoId});

  @override
  _YouTubeVideoPlayerState createState() => _YouTubeVideoPlayerState();
}

class _YouTubeVideoPlayerState extends State<YouTubeVideoPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        controlsVisibleAtStart: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await Future.delayed(const Duration(seconds: 1));
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
        Get.back();
        _controller.dispose();

        return false;
      },
      child: Scaffold(
        body: Center(
          child: YoutubePlayer(
            controller: _controller,
            liveUIColor: Colors.amber,
            actionsPadding: const EdgeInsets.all(50),
            progressColors: const ProgressBarColors(
                backgroundColor: Colors.white,
                playedColor: Colors.red,
                bufferedColor: Colors.blue,
                handleColor: Colors.blue),
          ),
        ),
      ),
    );
  }
}
