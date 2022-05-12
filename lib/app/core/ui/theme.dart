/*
 * 앱 전체 디폴트 테마 데이터
 */

import 'package:flutter/material.dart';
import 'package:flutter_codal/app/core/ui/core_ui.dart';

ThemeData theme() {
  return ThemeData(
    primaryColor: ColorPalette.bg,
    scaffoldBackgroundColor: ColorPalette.bg,
    fontFamily: Spoqa.spoqa,
    // TODO Change
    appBarTheme: const AppBarTheme(
      toolbarHeight: kAppBarHeight,
      color: ColorPalette.bg,
      elevation: 0,
      iconTheme: IconThemeData(color: ColorPalette.white),
      titleTextStyle: Spoqa.black_s20_w700_h28,
      toolbarTextStyle: Spoqa.black_s20_w700_h28,
    ),
    // TODO Change
    textTheme: const TextTheme(
      bodyLarge: Spoqa.black_s20_w700_h28,
      bodyMedium: Spoqa.black_s20_w700_h28,
      bodySmall: Spoqa.black_s20_w700_h28,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

ThemeData themeDark() {
  return ThemeData(
    primaryColor: ColorPalette.bgDark,
    scaffoldBackgroundColor: ColorPalette.bgDark,
    fontFamily: Spoqa.spoqa,
    // TODO Change
    appBarTheme: const AppBarTheme(
      toolbarHeight: kAppBarHeight,
      color: ColorPalette.bgDark,
      elevation: 0,
      iconTheme: IconThemeData(color: ColorPalette.white),
      titleTextStyle: Spoqa.black_s20_w700_h28,
      toolbarTextStyle: Spoqa.black_s20_w700_h28,
    ),
    // TODO Change
    textTheme: const TextTheme(
      bodyLarge: Spoqa.black_s20_w700_h28,
      bodyMedium: Spoqa.black_s20_w700_h28,
      bodySmall: Spoqa.black_s20_w700_h28,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
