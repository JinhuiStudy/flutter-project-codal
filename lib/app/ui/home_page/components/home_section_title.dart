import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_codal/app/core/ui/core_ui.dart';
import 'package:flutter_codal/app/data/local/theme/theme_cubit.dart';
import 'package:flutter_codal/app/ui/components/codal_svg.dart';

class HomeSectionTitle extends StatelessWidget {
  const HomeSectionTitle({Key? key, required this.text, required this.icon, required this.isSvg ,required this.onTap}) : super(key: key);

  final String text;
  final String icon;
  final bool isSvg;
  final Function() onTap;

  Widget _png(){
    const path = "assets/png/";
    return Image.asset("$path$icon.png");
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<ThemeCubit>().state.isDark;
    return Row(
      children: [
        Text(text, style: isDark ? Spoqa.textMainDark_s16_w700_h16 : Spoqa.textMain_s16_w700_h16),
        eWidth(6),
        isSvg ? CodalSvg(fileName: icon) : _png(),
        const Spacer(),
        GestureDetector(
          onTap: onTap,
          child: const CodalSvg(fileName: 'keyboard_arrow_right'),
        ),
      ],
    );
  }
}
