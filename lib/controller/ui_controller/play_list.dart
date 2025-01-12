import 'dart:developer';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayListController extends GetxController {
  List<String> videoList = [
    "https://www.youtube.com/watch?v=CGDv3pOLJgE",
    "https://www.youtube.com/watch?v=0P_2LspJAko&t=658s",
    "https://www.youtube.com/watch?v=l-jpHXdQWEE",
    "https://www.youtube.com/watch?v=apEjsLTVsho",
  ];
  RxList<String> thumbnailList = <String>[].obs;
  RxList<String> videoIDList = <String>[].obs;

  String getTitleFromUrl(String videoUrl) {
    return YoutubePlayer.convertUrlToId(videoUrl) ?? "Invalid URL";
  }

  getThumbnailList() async {
    for (var i in videoList) {
      var id = getTitleFromUrl(i);
      var thumbs = YoutubePlayer.getThumbnail(videoId: id);
      videoIDList.add(id);
      thumbnailList.add(thumbs);
      log("message : $thumbs");
      //===================== Static Code ================
      // if (i.contains("v=")) {
      //   thumbnailList.add("${Uri.parse(i).queryParameters["v"]}");
      // } else if (i.contains("youtu.be/")) {
      //   thumbnailList.add(Uri.parse(i).pathSegments.last);
      // }
      // =================================================
    }
  }

  @override
  void onInit() {
    getThumbnailList();
    super.onInit();
  }

 
}
