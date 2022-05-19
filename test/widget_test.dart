// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_codal/app/app.dart';
import 'package:flutter_codal/app/core/routes/routes.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    final map = <String, Widget Function(BuildContext context)>{};
    for (var e in Routes.values) {
      map[e.path] = (BuildContext context) => e.page;
    }
    print(map);
  });
}
