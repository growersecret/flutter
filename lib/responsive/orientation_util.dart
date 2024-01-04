import 'package:flutter/material.dart';

class OrientationUtil {
  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;

  }
}
