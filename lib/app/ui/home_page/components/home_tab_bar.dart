import 'package:flutter/material.dart';

class HomeTabBar extends StatelessWidget {
  const HomeTabBar({Key? key, required this.tabController}) : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: TabBar(
        controller: tabController,
        padding: EdgeInsets.zero,
        labelPadding: EdgeInsets.zero,
        indicatorPadding: EdgeInsets.zero,
        indicatorWeight: 2,
        indicatorColor: Colors.black,
        tabs: const [
          Tab(text: '연습 문제',height: 40),
          Tab(text: '커뮤니티',height: 40),
        ],
      ),
    );
  }
}
