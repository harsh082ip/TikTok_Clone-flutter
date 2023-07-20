import 'package:flutter/material.dart';
import 'package:tiktok_clone/views/Screens/widgets/profile_button.dart';
import 'package:tiktok_clone/views/Screens/widgets/tiktok_video_player.dart';

class DisplayVideoScreen extends StatelessWidget {
  const DisplayVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 10,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          itemBuilder: (context, index) {
            return Stack(
              children: [
                TikTokVideoPlayer(videoUrl: 'aaa'),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '@username',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'My Caption is here',
                        style: TextStyle(fontSize: 15.0),
                      ),
                      Text(
                        'Music Name',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height - 500,
                    width: 100,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 3, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ProfileButton(
                            profilePhotoUrl:
                                'https://firebasestorage.googleapis.com/v0/b/tiktok-clone-49afd.appspot.com/o/Profile%20Pictures%2FfU0XHCgO1YOmHUcRMz4xQGyLaK12?alt=media&token=0fb96a5f-24e8-41c6-8ec0-23b294f63808'),
                        Column(
                          children: [
                            Icon(
                              Icons.favorite,
                              size: 45,
                              color: Colors.white,
                            ),
                            Text(
                              'Like',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.reply,
                              size: 45,
                              color: Colors.white,
                            ),
                            Text(
                              'Share',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.comment,
                              size: 45,
                              color: Colors.white,
                            ),
                            Text(
                              'Comments',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
