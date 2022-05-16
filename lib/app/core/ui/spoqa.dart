import 'package:flutter/material.dart';
import 'package:flutter_codal/app/core/ui/core_ui.dart';

class Spoqa {
  static const spoqa = "Spoqa";

  static const black_s10_w500_h14 = CustomTextStyle(fontFamily: spoqa, color: ColorPalette.black, fontSize: 10, fontWeight: FontWeight.w500, height: 14);
  static const black_s20_w700_h28 = CustomTextStyle(fontFamily: spoqa, color: ColorPalette.black, fontSize: 20, fontWeight: FontWeight.w700, height: 28);

  static const textSub_s14_w400_h18 = CustomTextStyle(fontFamily: spoqa, color: ColorPalette.textSub, fontSize: 14, fontWeight: FontWeight.w400, height: 18);
  static const textSubDark_s14_w400_h18 = CustomTextStyle(fontFamily: spoqa, color: ColorPalette.textSubDark, fontSize: 14, fontWeight: FontWeight.w400, height: 18);
}

class CustomTextStyle extends TextStyle {
  const CustomTextStyle({
    required String fontFamily,
    required Color color,
    required double fontSize,
    required FontWeight fontWeight,
    int? height,
    Paint? foreground,
  }) : super(
          fontFamily: fontFamily,
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          height: height == null ? null : height / fontSize,
          leadingDistribution: TextLeadingDistribution.even,
          foreground: foreground,
        );
}
