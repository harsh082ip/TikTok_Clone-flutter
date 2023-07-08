import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants.dart';

class AddVideo extends StatelessWidget {
  const AddVideo({super.key});

  videoPicker(ImageSource src) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Get.snackbar('Video Picked', video.path);
    } else {
      Get.snackbar('Error', 'Some Error Occured');
    }
  }

  showDialogBox(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            SimpleDialogOption(
              onPressed: () {
                videoPicker(ImageSource.gallery);
              },
              child: Text('Gallery'),
            ),
            SimpleDialogOption(
              onPressed: () {},
              child: Text('Camera'),
            ),
            SimpleDialogOption(
              onPressed: () {},
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            showDialogBox(context);
          },
          child: Container(
            width: 150,
            height: 40,
            decoration: BoxDecoration(color: buttonColor),
            child: const Center(
              child: Text(
                'Add Video',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
