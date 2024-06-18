import 'package:flutter/widgets.dart';

extension HeightOrWidthExtension on num {
  SizedBox get verticalH => SizedBox(height: toDouble());
  SizedBox get horizontalW => SizedBox(width: toDouble());
}
