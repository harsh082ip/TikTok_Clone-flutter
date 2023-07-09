import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class CaptionVideoFullScreen extends StatelessWidget {
  final VideoPlayerController videoPlayerController;
  CaptionVideoFullScreen({super.key, required this.videoPlayerController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pulse(
        child: Stack(
          children: [
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.white)),
              // margin: EdgeInsets.symmetric(horizontal: 2.0).copyWith(top: 10.0),
              height: MediaQuery.of(context).size.height,
              child: VideoPlayer(videoPlayerController),
            ),
            Positioned(
              bottom: 0,
              right: 2,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.fullscreen_exit,
                  size: 35.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
