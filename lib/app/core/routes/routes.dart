import 'package:flutter/material.dart';
import 'package:flutter_codal/app/ui/home_page/home_page.dart';

enum Routes {
  home,
}

const routesPath = {
  Routes.home: "/banners",
};

final pages = {
  Routes.home.path: (context) => const HomePage(),
};

extension RoutesExtension on Routes {
  String get path => routesPath[this]!;

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
