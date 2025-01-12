import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player/controller/ui_controller/play_list.dart';
import 'package:youtube_player/view/video_play/youtube_video_player.dart';

class PlayListScreen extends StatelessWidget {
  const PlayListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PlayListController playListController = Get.put(PlayListController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Play List"),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: playListController.thumbnailList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> YouTubeVideoPlayer(videoId: playListController.videoIDList[index])));
              },
              child: Card(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        height: 100,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(playListController.thumbnailList[index]),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      flex: 6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("data"),
                          Text("data"),
                          Text("data"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
