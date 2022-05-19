import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_codal/app/core/ui/core_ui.dart';
import 'package:flutter_codal/app/data/local/theme/theme_cubit.dart';
import 'package:flutter_codal/app/data/server/home/home_cubit.dart';
import 'package:flutter_codal/app/ui/home_page/components/home_community_tab_view.dart';
import 'package:flutter_codal/app/ui/home_page/components/home_exercise_tab_view.dart';
import 'package:flutter_codal/app/ui/home_page/components/home_tab_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<ThemeCubit>().state.isDark;
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(create: (context) => HomeCubit()..getData()),
      ],
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ..._header(isDark),
            eHeight(16),
            HomeTabBar(tabController: _tabController),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  HomeExerciseTabView(),
                  HomeCommunityTabView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _header(bool isDark) {
    CustomTextStyle point =
    isDark ? Spoqa.textMainDark_s16_w700_h24 : Spoqa.textMain_s16_w700_h24;
    CustomTextStyle common =
    isDark ? Spoqa.textMainDark_s14_w400_h24 : Spoqa.textMain_s14_w400_h24;
    return [
      Text.rich(
        TextSpan(
          children: [
            TextSpan(text: '유애나', style: point),
            TextSpan(text: '님, 반가워요!', style: common),
          ],
        ),
      ),
      Text('궁금하신 언어가 있으신가요?', style: common),
    ];
  }
}
