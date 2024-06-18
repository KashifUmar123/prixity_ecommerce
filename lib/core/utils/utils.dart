import 'package:flutter/material.dart';

class Utils {
  static bool isColorLighterThanGray(Color color) {
    double luminance = color.computeLuminance();
    double threshold = 0.7;
    return luminance > threshold;
  }
}
