import 'dart:ui';

import 'package:flutter/material.dart';

class ConstantColors {
  static Color whiteColor = const Color(0xFFFFFFFF);
  static Color transparentWhiteColor = whiteColor.withOpacity(0.17);
  static Color gradientBeginColor = const Color(0xFF0B2497).withOpacity(0.9);
  static Color gradientStopColor = const Color(0xFF2372D0).withOpacity(0.8);
}

final gradient = LinearGradient(colors: [
  ConstantColors.gradientBeginColor,
  ConstantColors.gradientStopColor,
], begin: Alignment.bottomLeft, end: Alignment.topRight);



class Pallete {
  static const Color backgroundColor = Color.fromRGBO(24, 24, 32, 1);
  static const Color gradient1 = Color.fromRGBO(187, 63, 221, 1);
  static const Color gradient2 = Color.fromRGBO(251, 109, 169, 1);
  static const Color gradient3 = Color.fromRGBO(255, 159, 124, 1);
  static const Color borderColor = Color.fromRGBO(52, 51, 67, 1);
  static const Color whiteColor = Colors.white;
}