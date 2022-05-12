import 'package:flutter/material.dart';
import 'package:flutter_codal/app/ui/components/codal_svg.dart';

class SocialIcon extends StatelessWidget {
  const SocialIcon({
    Key? key,
    required this.fileName,
    this.onTab,
  }) : super(key: key);

  final String fileName;
  final void Function()? onTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("test");
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Theme.of(context).dividerColor),
        ),
        alignment: Alignment.center,
        child: CodalSvg(fileName: fileName),
      ),
    );
  }
}
