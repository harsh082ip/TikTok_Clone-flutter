import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tiktok_clone/views/Screens/add_video.dart';
import 'package:tiktok_clone/views/Screens/display_video_screen.dart';

// getRandom() func
getRandomColor() => [
      Colors.blueAccent,
      Colors.redAccent,
      Colors.greenAccent,
    ][Random().nextInt(3)];

const bgColor = Colors.black;
const buttonColor = Colors.redAccent;
const borderColor = Colors.grey;

var pageIndex = [
  DisplayVideoScreen(),
  Text('Search'),
  AddVideo(),
  Text('Messages'),
  Text('Profile'),
];
