import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_codal/app/data/local/theme/theme_cubit.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.watch<ThemeCubit>();
    final isDark = themeCubit.state.isDark;
    return Center(
      child: Switch(
          value: isDark,
          onChanged: (v) {
            themeCubit.changeTheme(isDark: v);
          }),
    );
  }
}
