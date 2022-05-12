import 'package:flutter/material.dart';
import 'package:flutter_codal/app/core/routes/routes.dart';
import 'package:flutter_codal/app/core/ui/core_ui.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      routes: pages,
      initialRoute: Routes.home.path,
    );
  }
}
