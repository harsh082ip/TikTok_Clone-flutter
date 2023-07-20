import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/controller/upload_video_controller.dart';
import 'package:tiktok_clone/views/Screens/add_caption_full_screen.dart';
import 'package:tiktok_clone/views/Screens/widgets/text_input_field.dart';

import 'package:video_player/video_player.dart';

class AddCaptionScreen extends StatefulWidget {
  File videoFile;
  String videoPath;
  AddCaptionScreen(
      {super.key, required this.videoFile, required this.videoPath});

  @override
  State<AddCaptionScreen> createState() => _AddCaptionScreenState();
}

class _AddCaptionScreenState extends State<AddCaptionScreen> {
  late VideoPlayerController videoPlayerController;
  final TextEditingController musicNameController = TextEditingController();
  final TextEditingController captionController = TextEditingController();
  VideoUploadController videoUploadController =
      Get.put(VideoUploadController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      videoPlayerController = VideoPlayerController.file(widget.videoFile);
    });
    videoPlayerController.initialize();
    videoPlayerController.play();
    videoPlayerController.setLooping(true);
    videoPlayerController.setVolume(0.7);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.white)),
                  margin: EdgeInsets.symmetric(horizontal: 10.0)
                      .copyWith(top: 10.0),
                  height: MediaQuery.of(context).size.height / 1.4,
                  child: VideoPlayer(videoPlayerController),
                ),
                Positioned(
                  bottom: 0,
                  right: 11,
                  child: InkWell(
                    onTap: () {
                      Get.to(CaptionVideoFullScreen(
                          videoPlayerController: videoPlayerController));
                    },
                    child: const Icon(
                      Icons.fullscreen,
                      size: 35.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              width: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  TextInputField(
                      controller: musicNameController,
                      icon: Icons.music_note,
                      labelText: 'Add Music Name'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.0155,
                  ),
                  TextInputField(
                      controller: captionController,
                      icon: Icons.closed_caption,
                      labelText: 'Add caption'),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.020,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
              onPressed: () {
                videoUploadController.uploadVideo(musicNameController.text,
                    captionController.text, widget.videoPath);
              },
              child: const Text(
                'Upload Video',
                style: TextStyle(fontSize: 22.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
