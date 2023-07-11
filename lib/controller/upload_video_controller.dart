import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:video_compress/video_compress.dart';

class VideoUploadController extends GetxController {
  // Uuid package for unique Id
  var uuid = Uuid();

  //Main Video Upload function
  uploadVideo(String songName, String caption, String videoPath) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    String id = uuid.v1();
    _uploadVideoToFirebaseStorage(id, videoPath);

    String thumbnail =
        await _uploadVideoThumbnailToFirebaseStorage(id, videoPath);
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
