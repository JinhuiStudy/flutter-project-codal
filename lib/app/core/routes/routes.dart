import 'package:flutter/material.dart';
import 'package:flutter_codal/app/ui/login_page/login_page.dart';
import 'package:flutter_codal/app/ui/main_page/main_page.dart';

typedef PageBuilder = Widget Function(BuildContext context);

enum Routes {
  main("/main", MainPage()),
  login("/login", LoginPage());

  final String path;
  final Widget page;
  const Routes(this.path, this.page);
}

final pages = generatePages();

Map<String, PageBuilder> generatePages() {
  final map = <String, PageBuilder>{};
  for (var e in Routes.values) {
    map[e.path] = (BuildContext context) => e.page;
  }
  return map;
}

extension RoutesExtension on Routes {
  Future<T?> push<T extends Object?>(BuildContext context, {Object? arguments}) async {
    return await Navigator.of(context).pushNamed<T?>(path, arguments: arguments);
  }

  Future<T?> popAndPush<T extends Object?, TO extends Object?>(BuildContext context, {TO? result, Object? arguments}) async {
    return await Navigator.of(context).popAndPushNamed<T, TO>(path, result: result, arguments: arguments);
  }

  Future<T?> pushAndRemoveAll<T extends Object?>(BuildContext context, {Object? arguments}) async {
    return await Navigator.of(context).pushNamedAndRemoveUntil<T>(path, (route) => false);
  }
}

extension BuildContextExtension on BuildContext {
  void back() => Navigator.of(this).pop();
  dynamic arguments() {
    return ModalRoute.of(this)?.settings.arguments;
  }
}
