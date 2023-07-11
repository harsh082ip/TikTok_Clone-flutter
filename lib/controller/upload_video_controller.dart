import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/models/video.dart';
import 'package:uuid/uuid.dart';
import 'package:video_compress_ds/video_compress_ds.dart';

class VideoUploadController extends GetxController {
  // Uuid package for unique Id
  var uuid = Uuid();

  //Main Video Upload function
  uploadVideo(String songName, String caption, String videoPath) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;

      DocumentSnapshot userDoc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();

      String id = uuid.v1();
      String videoUrl = await _uploadVideoToFirebaseStorage(id, videoPath);

      String thumbnail =
          await _uploadVideoThumbnailToFirebaseStorage(id, videoPath);

      Video video = Video(
          username: (userDoc.data()! as Map<String, dynamic>)['name'],
          uid: uid,
          id: id,
          likes: [],
          commentsCount: 0,
          shareCount: 0,
          songName: songName,
          caption: caption,
          videoUrl: videoUrl,
          thumbnail: thumbnail,
          profilePic: (userDoc.data()! as Map<String, dynamic>)['Profile Pic']);

      await FirebaseFirestore.instance
          .collection('videos')
          .doc()
          .set(video.toJson())
          .then((value) {
        Get.snackbar('Video Uploaded Successfully', 'Congrats');
      });
    } catch (e) {
      log(e.toString());
      Get.snackbar('Error Uploading Video', e.toString());
    }
  }

  //Video Thumb To Storage
  Future<String> _uploadVideoThumbnailToFirebaseStorage(
      String id, String videoPath) async {
    Reference reference =
        FirebaseStorage.instance.ref().child('Thumbnails').child(id);
    UploadTask uploadTask = reference.putFile(await _getThumbnail(videoPath));
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  //Video Thumbnail get function()
  Future<File> _getThumbnail(String videoPath) async {
    final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
    return thumbnail;
  }

  //Video To Storage function
  Future<String> _uploadVideoToFirebaseStorage(
      String videoId, String videoPath) async {
    Reference reference =
        FirebaseStorage.instance.ref().child('Videos').child(videoId);
    UploadTask uploadTask = reference.putFile(await _compressVideo(videoPath));
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  //Video Compress function
  _compressVideo(String videoPath) async {
    final compressedVideo = await VideoCompress.compressVideo(videoPath,
        quality: VideoQuality.MediumQuality);
    return compressedVideo!.file;
  }
}
