import 'dart:math';

import 'package:flutter/material.dart';

// getRandom() func
getRandomColor() => [
      Colors.blueAccent,
      Colors.redAccent,
      Colors.greenAccent,
    ][Random().nextInt(3)];

const bgColor = Colors.black;
const buttonColor = Colors.redAccent;
const borderColor = Colors.grey;
