import 'package:flutter/material.dart';
import 'package:flutter_codal/app/core/ui/core_ui.dart';
import 'package:flutter_codal/app/ui/login_page/components/login_body.dart';
import 'package:flutter_codal/app/ui/login_page/components/mode_toggle_appbar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Devide Height
    SizeHelper.init(context);
    return Scaffold(
      appBar: ModeToggleAppBar(),
      body: const LoginBody(),
    );
  }
}
