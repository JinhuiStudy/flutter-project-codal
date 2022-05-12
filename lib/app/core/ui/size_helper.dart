import 'package:flutter/material.dart';

/// empty height
Widget eHeight(double height) => SizedBox(height: height);

/// empty width
Widget eWidth(double width) => SizedBox(width: width);

const kHorizontalPadding = 24.0;

const kAppBarHeight = 56.0;

class SizeHelper {
  static const baseW = 375.0;
  static const baseH = 812.0;
  static double deviceWidth = 0;
  static double deviceHeight = 0;
  static init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    deviceWidth = size.width;
    deviceHeight = size.height;
  }
}

extension DoubleExt on double {
  double get w => this / SizeHelper.baseW * SizeHelper.deviceWidth;
  double get h => this / SizeHelper.baseH * SizeHelper.deviceHeight;
}
