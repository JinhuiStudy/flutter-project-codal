/*
 * 앱 전체 디폴트 테마 데이터
 */

import 'package:flutter/material.dart';
import 'package:flutter_codal/app/core/ui/core_ui.dart';

ThemeData theme() {
  return ThemeData(
    primaryColor: ColorPalette.bg,
    scaffoldBackgroundColor: ColorPalette.bg,
    dividerColor: ColorPalette.divider,
    fontFamily: Spoqa.spoqa,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      // fixed 해주지 않으면 각각 아이템의 bg로 적용
      type: BottomNavigationBarType.fixed,
      backgroundColor: ColorPalette.bg,
      selectedItemColor: ColorPalette.textTabEnable,
      unselectedItemColor: ColorPalette.textTabdisableDark,
      selectedLabelStyle: Spoqa.black_s10_w500_h14,
      unselectedLabelStyle: Spoqa.black_s10_w500_h14,
      showUnselectedLabels: true,
    ),
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
      caption: Spoqa.textSub_s14_w400_h18,
    ),
    tabBarTheme: const TabBarTheme(
        labelStyle: Spoqa.textTabEnable_s12_w700_h14,
        unselectedLabelStyle: Spoqa.textTabDisable_s12_w700_h14,
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
                width: 2,
                color: ColorPalette.textTabEnable
            )
        )
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

ThemeData themeDark() {
  return ThemeData(
    primaryColor: ColorPalette.bgDark,
    scaffoldBackgroundColor: ColorPalette.bgDark,
    dividerColor: ColorPalette.dividerDark,
    fontFamily: Spoqa.spoqa,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: ColorPalette.bgDark,
      selectedItemColor: ColorPalette.white,
      unselectedItemColor: ColorPalette.textTabdisableDark,
      selectedIconTheme: IconThemeData(color: Colors.white),
      selectedLabelStyle: Spoqa.black_s10_w500_h14,
      unselectedLabelStyle: Spoqa.black_s10_w500_h14,
      showUnselectedLabels: true,
    ),
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
      caption: Spoqa.textSubDark_s14_w400_h18,
    ),
    tabBarTheme: const TabBarTheme(
        labelStyle: Spoqa.textTabEnableDark_s12_w700_h14,
        unselectedLabelStyle: Spoqa.textTabDisableDark_s12_w700_h14,
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
                width: 2,
                color: ColorPalette.textTabEnableDark
            )
        )
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
