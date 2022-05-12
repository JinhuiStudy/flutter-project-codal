import 'package:flutter/material.dart';
import 'package:flutter_codal/app/core/ui/core_ui.dart';

class ThemeState {
  ThemeState({required this.isDark});
  bool isDark;

  ThemeData get themeData {
    return isDark ? themeDark() : theme();
  }
}
