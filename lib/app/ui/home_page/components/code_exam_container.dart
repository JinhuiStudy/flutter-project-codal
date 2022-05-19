import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_codal/app/core/ui/core_ui.dart';
import 'package:flutter_codal/app/data/local/theme/theme_cubit.dart';
import 'package:flutter_codal/app/ui/home_page/components/exam_level_box.dart';

class CodeTestContainer extends StatelessWidget {
  const CodeTestContainer(
      {Key? key,
      required this.title,
      required this.source,
      required this.lang,
      required this.level,
      this.onTap})
      : super(key: key);

  final String title;
  final String source;
  final List<String> lang;
  final String level;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<ThemeCubit>().state.isDark;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Theme.of(context).dividerColor),
        color: Colors.transparent,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(isDark),
          eHeight(6),
          _source(isDark),
          eHeight(20),
          _langAndLevelRow(isDark)
        ],
      ),
    );
  }

  Widget _title(bool isDark) => Text(title, style: isDark ? Spoqa.textTabEnableDark_s14_w500_h16 : Spoqa.textTabEnable_s14_w500_h16);

  Widget _source(bool isDark) => Text(source, style: isDark ? Spoqa.textSubDark_s10_w400_h14 : Spoqa.textSub_s10_w400_h14);

  Widget _langAndLevelRow(bool isDark) {
    double maxWidth = (SizeHelper.deviceWidth - kHorizontalPadding*2 - 32) * 0.7;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Wrap(
            runSpacing: 8,
            verticalDirection: VerticalDirection.up,
            children: List.generate(lang.length, (index) => Container(
              width: 20,
              height: 20,
              color: Colors.red,
              margin: const EdgeInsets.only(right: 13),
            ),),
          ),
        ),
        ExamLevelBox(
            width: 44,
            height: 20,
            level: level,
            textStyle: Spoqa.white_s10_w500_h14,
        ),
      ],
    );
  }
}
