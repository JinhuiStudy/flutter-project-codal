import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_codal/app/core/ui/core_ui.dart';
import 'package:flutter_codal/app/data/local/theme/theme_cubit.dart';

class FilterBox extends StatelessWidget {
  const FilterBox({Key? key, required this.label, required this.onTap}) : super(key: key);

  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<ThemeCubit>().state.isDark;
    CustomTextStyle style = isDark ? Spoqa.textSubDark_s12_w500_h14 : Spoqa.point_s12_w500_h14;
    Color color = isDark ? ColorPalette.textSub : ColorPalette.point;
    return UnconstrainedBox(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(color: color),
        ),
        padding: const EdgeInsets.only(left: 6, right: 5, top: 5, bottom: 5),
        child: Row(
          children: [
            Text(label, style: style),
            GestureDetector(
                onTap: onTap,
                child: Icon(Icons.close, size: 14, color: color),
            ),
          ],
        ),
      ),
    );
  }
}
