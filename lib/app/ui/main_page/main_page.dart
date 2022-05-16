import 'package:flutter/material.dart';
import 'package:flutter_codal/app/ui/career_page/career_page.dart';
import 'package:flutter_codal/app/ui/coding_page/coding_page.dart';
import 'package:flutter_codal/app/ui/community_page/community_page.dart';
import 'package:flutter_codal/app/ui/home_page/home_page.dart';
import 'package:flutter_codal/app/ui/main_page/components/main_app_bar.dart';
import 'package:flutter_codal/app/ui/main_page/components/main_bottom_nav.dart';
import 'package:flutter_codal/app/ui/talk_page/talk_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MainPage> with TickerProviderStateMixin {
  late BottomNavController controller = BottomNavController()..addListener(() => setState(() {}));

  final bodys = [
    const HomePage(),
    const CodingPage(),
    const CommunityPage(),
    const CareerPage(),
    const TalkPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      bottomNavigationBar: MainBottomNav(controller: controller),
      extendBody: true,
      body: bodys[controller.index],
    );
  }
}
