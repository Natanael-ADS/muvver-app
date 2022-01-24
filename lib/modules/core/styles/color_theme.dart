// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class ColorTheme {
  static const PRIMARY = Colors.green;
  static const SECOND = Color(0xFF222222);
  static const THIRD = Colors.white10;
  static const FOURTH = Colors.grey;

  static BoxDecoration linearGradient() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.bottomLeft,
        colors: [Color(0xFF222222), Color(0xFF353740)],
      ),
    );
  }
}

class ColorText {
  static const PRIMARY = Colors.black;
  static const SECOND = Colors.grey;
  static const THIRD = Colors.white;
}
