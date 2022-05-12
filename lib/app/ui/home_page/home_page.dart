import 'package:flutter/material.dart';
import 'package:flutter_codal/app/ui/home_page/components/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const HomeBody(),
    );
  }
}
