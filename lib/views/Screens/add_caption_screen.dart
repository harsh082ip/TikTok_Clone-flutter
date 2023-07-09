import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';
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
    videoPlayerController.setVolume(0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.4,
              child: VideoPlayer(videoPlayerController),
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
              onPressed: () {},
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
