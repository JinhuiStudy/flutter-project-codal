import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_codal/app/data/local/theme/theme_cubit.dart';
import 'package:flutter_svg/svg.dart';

class CodalSvg extends StatelessWidget {
  const CodalSvg({
    Key? key,
    required this.fileName,
  }) : super(key: key);

  final String fileName;

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeCubit>().state.isDark;
    final path = isDark ? "assets/svg/dark/" : "assets/svg/light/";
    return SvgPicture.asset("$path$fileName.svg");
  }
}
