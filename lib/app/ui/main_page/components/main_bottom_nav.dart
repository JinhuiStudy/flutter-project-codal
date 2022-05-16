import 'package:flutter/material.dart';
import 'package:flutter_codal/app/ui/components/codal_svg.dart';

class MainBottomNav extends StatelessWidget {
  const MainBottomNav({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final BottomNavController controller;

  @override
  Widget build(BuildContext context) {
    final labels = ["홈", "코달 코딩", "커뮤니티", "커리어", "코달톡"];
    final icons = ["home", "code", "community", "career", "chat"];

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Divider(
          height: 2,
          thickness: 1.5,
        ),
        BottomNavigationBar(
          onTap: (int i) {
            controller.index = i;
          },
          currentIndex: controller.index,
          items: List.generate(5, (index) {
            final icon = icons[index];
            return BottomNavigationBarItem(
              activeIcon: Container(
                child: CodalSvg(fileName: "bottom_nav/${icon}_on"),
                padding: const EdgeInsets.only(bottom: 6),
              ),
              icon: Container(
                child: CodalSvg(fileName: "bottom_nav/${icon}_off"),
                padding: const EdgeInsets.only(bottom: 6),
              ),
              label: labels[index],
            );
          }),
        )
      ],
    );
  }
}

class BottomNavController extends ChangeNotifier {
  int _index = 0;
  int get index => _index;
  set index(int v) {
    _index = v;
    notifyListeners();
  }
}
