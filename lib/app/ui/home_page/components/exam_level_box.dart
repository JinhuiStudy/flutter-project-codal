import 'package:flutter/material.dart';
import 'package:flutter_codal/app/core/ui/core_ui.dart';

class ExamLevelBox extends StatelessWidget {
  const ExamLevelBox({Key? key, required this.width, required this.height, required this.level, this.radius = 2, required this.textStyle}) : super(key: key);

  final double width;
  final double height;
  final String level;
  final double radius;
  final CustomTextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: ColorPalette.point
      ),
      alignment: Alignment.center,
      child: Text(level, style: textStyle),
    );
  }
}
