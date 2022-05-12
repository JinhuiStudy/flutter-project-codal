import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_codal/app/core/ui/core_ui.dart';
import 'package:flutter_codal/app/data/local/theme/theme_cubit.dart';
import 'package:flutter_codal/app/data/local/theme/theme_state.dart';
import 'package:flutter_codal/app/ui/components/codal_png.dart';

class ModeToggleAppBar extends AppBar with PreferredSizeWidget {
  ModeToggleAppBar({Key? key})
      : super(
          key: key,
          actions: [
            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) => SizedBox(
                width: 24,
                height: 24,
                child: GestureDetector(
                  onTap: () => context.read<ThemeCubit>().changeTheme(isDark: !state.isDark),
                  child: const CodalPng(fileName: "mode"),
                ),
              ),
            ),
            eWidth(kHorizontalPadding),
          ],
        );
}
