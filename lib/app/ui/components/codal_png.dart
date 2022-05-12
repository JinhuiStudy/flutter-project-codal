import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_codal/app/data/local/theme/theme_cubit.dart';

class CodalPng extends StatelessWidget {
  const CodalPng({
    Key? key,
    required this.fileName,
  }) : super(key: key);

  final String fileName;

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeCubit>().state.isDark;
    final path = isDark ? "assets/png/dark/" : "assets/png/light/";
    return Image.asset("$path$fileName.png");
  }
}
