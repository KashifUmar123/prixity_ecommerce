import 'package:flutter/material.dart';

extension PaddingExtension on Widget {
  Padding horizontalPadding(double padding) => Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: padding),
        child: this,
      );

  Padding verticalPadding(double padding) => Padding(
        padding: EdgeInsetsDirectional.symmetric(vertical: padding),
        child: this,
      );

  Padding topPadding(double padding) => Padding(
        padding: EdgeInsetsDirectional.only(top: padding),
        child: this,
      );

  Padding endPadding(double padding) => Padding(
        padding: EdgeInsetsDirectional.only(end: padding),
        child: this,
      );

  Padding bottomPadding(double padding) => Padding(
        padding: EdgeInsetsDirectional.only(bottom: padding),
        child: this,
      );

  Padding startPadding(double padding) => Padding(
        padding: EdgeInsetsDirectional.only(start: padding),
        child: this,
      );
}
