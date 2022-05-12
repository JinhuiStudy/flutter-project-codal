/*
 * 앱 전체 디폴트 테마 데이터
 */

import 'package:flutter/material.dart';
import 'package:flutter_codal/app/core/ui/core_ui.dart';

ThemeData theme() {
  return ThemeData(
    primaryColor: ColorPalette.black,
    scaffoldBackgroundColor: ColorPalette.white,
    fontFamily: Spoqa.spoqa,
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

// TODO Change
AppBarTheme appBarTheme() {
  return const AppBarTheme(
    toolbarHeight: kAppBarHeight,
    color: ColorPalette.white,
    elevation: 0,
    iconTheme: IconThemeData(color: ColorPalette.white),
    titleTextStyle: Spoqa.black_s20_w700_h28,
    toolbarTextStyle: Spoqa.black_s20_w700_h28,
  );
}

// TODO Change
TextTheme textTheme() {
  return const TextTheme(
    bodyLarge: Spoqa.black_s20_w700_h28,
    bodyMedium: Spoqa.black_s20_w700_h28,
    bodySmall: Spoqa.black_s20_w700_h28,
  );
}
