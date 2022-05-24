import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_codal/app/core/ui/core_ui.dart';
import 'package:flutter_codal/app/data/local/theme/theme_cubit.dart';
import 'package:flutter_codal/app/ui/components/codal_svg.dart';

class PopularRecentFilter extends StatelessWidget {
  const PopularRecentFilter({Key? key, required this.isPopular, required this.popularTap, required this.recentTap}) : super(key: key);

  final bool isPopular;
  final Function() popularTap;
  final Function() recentTap;

  @override
  Widget build(BuildContext context) {

    bool isDark = context.watch<ThemeCubit>().state.isDark;

    CustomTextStyle disableStyle = isDark ? Spoqa.textSubDark_s12_w400_h20 : Spoqa.textSub_s12_w400_h20;
    CustomTextStyle enableStyle = isDark ? Spoqa.textMainDark_s12_w400_h20 : Spoqa.textMain_s12_w400_h20;

    return Row(
      children: [
        GestureDetector(
          onTap: isPopular ? null : popularTap,
          child: Container(
            color: Colors.transparent,
            child: Row(
              children: [
                Container(
                  width: 11,
                  height: 13.98,
                  child: CodalSvg(fileName: isPopular ? 'popular_on' : 'popular_off'),
                ),
                eWidth(2.5),
                Text('인기 순', style: isPopular ? enableStyle : disableStyle),
              ],
            ),
          ),
        ),
        eWidth(11.5),
        GestureDetector(
          onTap: isPopular ? recentTap : null,
          child: Container(
            color: Colors.transparent,
            child: Row(
              children: [
                SizedBox(
                  width: 13.23,
                  height: 16,
                  child: CodalSvg(fileName: isPopular ? 'recent_off' : 'recent_on'),
                ),
                eWidth(2.5),
                Text('최신 순', style: isPopular ? disableStyle : enableStyle),
              ],
            ),
          ),
        )
      ],
    );;
  }
}
