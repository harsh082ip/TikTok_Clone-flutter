import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/models/users.dart';

class Auth extends GetxController {
  File? proImg;
  static Auth instnace = Get.find();

  pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final img = File(image.path);
    this.proImg = img;
  }

  // SignUp Function for Creating User in Firestore Database
  void SignUp(
      String username, String email, String password, File? image) async {
    try {
      // Checking if the values are not empty
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        UserCredential credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        // calling uploadImage() for uploading User Profile Pic
        String downloadURL = await uploadImage(image);

        myUser user = myUser(
            email: email,
            name: username,
            profilePhoto: downloadURL,
            uid: credential.user!.uid);

        await FirebaseFirestore.instance
            .collection('users')
            .doc(credential.user!.uid)
            .set(user.toJson());
      } else {
        Get.snackbar('Incomplete details', 'User Credentials cannot be empty');
      }
    } catch (e) {
      // Getx Snackbar to displaying error message
      Get.snackbar('Error', e.toString());
    }
  }

// Function for uploadinig image to Firebase Storage
  Future<String> uploadImage(File image) async {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('Profile Pictures')
        .child(FirebaseAuth.instance.currentUser!.uid);

    // uploading Image to Firestore Storage
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snapshot = await uploadTask;

    // Image Download Url
    String imageUrl = await snapshot.ref.getDownloadURL();
    return imageUrl;
  }
}
