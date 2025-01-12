import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player/view/play_list/play_list.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then(
    (_) => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: VideoPlayerWidget(videoUrl: 'https://github.com/user-attachments/assets/f60115b0-12ee-470c-aa67-ba5123ff07a5',),
      //home: YouTubeVideoPlayer(videoId: "Rb0QZWm8W5k"),
      home: PlayListScreen(),
    );
  }
}

