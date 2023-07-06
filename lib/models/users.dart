import 'package:cloud_firestore/cloud_firestore.dart';

class myUser {
  String name;
  String profilePhoto;
  String email;
  String uid;
  myUser({
    required this.email,
    required this.name,
    required this.profilePhoto,
    required this.uid,
  });

  // App ---> Firebase
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'Profile Pic': profilePhoto,
      'uid': uid
    };
  }

  // App to Firebase as Map
  static myUser fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return myUser(
        email: snapshot['email'],
        name: snapshot['name'],
        profilePhoto: snapshot['Profile Pic'],
        uid: snapshot['uid']);
  }
}
