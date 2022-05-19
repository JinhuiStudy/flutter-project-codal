import 'package:flutter/material.dart';
import 'package:flutter_codal/app/core/routes/routes.dart';
import 'package:flutter_codal/app/core/ui/core_ui.dart';
import 'package:flutter_codal/app/ui/components/codal_svg.dart';
import 'package:flutter_codal/app/ui/login_page/components/social_icon.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(flex: 113),
        const CodalSvg(fileName: "logo"),
        const Spacer(flex: 355),
        _loginBox(),
        const Spacer(flex: 50),
        _notLogin(context),
        const Spacer(flex: 100),
      ],
    );
  }

  Widget _loginBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SocialIcon(fileName: "ios"),
        eWidth(16),
        const SocialIcon(fileName: "google"),
        eWidth(16),
        const SocialIcon(fileName: "github"),
      ],
    );
  }

  Widget _notLogin(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Routes.main.push(context);
      },
      child: Text(
        "비회원으로 계속하기",
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }
}
