import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_codal/app/core/ui/core_ui.dart';
import 'package:flutter_codal/app/data/local/theme/theme_cubit.dart';
import 'package:flutter_codal/app/data/server/coding/coding_cubit.dart';
import 'package:flutter_codal/app/ui/components/codal_svg.dart';
import 'package:flutter_codal/app/ui/components/popular_recent_filter.dart';

class CodingPage extends StatelessWidget {
  const CodingPage({Key? key}) : super(key: key);

  Widget _title() {

    return Builder(
      builder: (context) {
        bool isDark = context.watch<ThemeCubit>().state.isDark;
        CustomTextStyle style = isDark ? Spoqa.textMainDark_s20_w700_h20 : Spoqa.textMain_s20_w700_h20;
        return Row(
          children: [
            Text('코달_Coding', style: style),
            eWidth(6),
            SizedBox(
              width: 21.45,
              height: 20,
              child: Image.asset('assets/png/computer.png'),
            ),
          ],
        );
      }
    );
  }

  Widget _firstFilter() {
    return Container(
      width: double.infinity,
      height: 24,
      color: Colors.red,
    );
  }

  Widget _secondFilter() {
    return Container(
      width: double.infinity,
      height: 24,
      color: Colors.red,
    );
  }

  Widget _thirdFilter() {
    return Builder(builder: (context) {
      final codingState = context.watch<CodingCubit>().state;
      return PopularRecentFilter(
          isPopular: codingState.isPopular,
          popularTap: () => context.read<CodingCubit>().filter(isPopular: true),
          recentTap: () => context.read<CodingCubit>().filter(isPopular: false),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CodingCubit>(create: (context) => CodingCubit()..getData()),
      ],
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        children: [
          _title(),
          eHeight(31),
          _firstFilter(),
          eHeight(12),
          _secondFilter(),
          eHeight(16),
          _thirdFilter(),
        ],
      ),
    );
  }
}
