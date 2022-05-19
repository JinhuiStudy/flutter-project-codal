import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_codal/app/core/ui/core_ui.dart';
import 'package:flutter_codal/app/data/local/theme/theme_cubit.dart';
import 'package:flutter_codal/app/data/local/theme/theme_state.dart';
import 'package:flutter_codal/app/ui/components/codal_png.dart';
import 'package:flutter_codal/app/ui/components/codal_svg.dart';

class MainAppBar extends AppBar with PreferredSizeWidget {
  MainAppBar({Key? key})
      : super(
          key: key,
          leading: const SizedBox(), // Back Button Remove
          actions: [
            eWidth(kHorizontalPadding),
            const CodalSvg(fileName: "logo_small"),
            const Spacer(),
            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) => GestureDetector(
                onTap: () => context.read<ThemeCubit>().changeTheme(isDark: !state.isDark),
                child: const CodalPng(fileName: "mode"),
              ),
            ),
            GestureDetector(
              onTap: () {
                print("search");
              },
              child: const CodalSvg(fileName: "search"),
            ),
            eWidth(12),
            GestureDetector(
              onTap: () {
                print("arlim_on");
              },
              child: const CodalSvg(fileName: "arlim_on"), // TODO arlim_off
            ),
            eWidth(12),
            GestureDetector(
              onTap: () {
                print("profile");
              },
              child: Align(
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            eWidth(kHorizontalPadding),
          ],
        );
}
