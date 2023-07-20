import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  String profilePhotoUrl;
  ProfileButton({super.key, required this.profilePhotoUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 70,
      child: Stack(
        children: [
          Positioned(
            left: 5,
            child: Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.network(
                  profilePhotoUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
