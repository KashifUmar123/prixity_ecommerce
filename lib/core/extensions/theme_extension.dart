import 'package:flutter/material.dart';

extension SizeExtension on BuildContext {
  // size
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  // system navigation and status bar heighs
  double get statusBarHeight => MediaQuery.of(this).padding.top;
  double get bottomBarHeight => MediaQuery.of(this).padding.bottom;
}
