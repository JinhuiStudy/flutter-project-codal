import 'package:flutter/material.dart';
import 'package:flutter_codal/app/ui/login_page/components/login_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const LoginBody(),
    );
  }
}
