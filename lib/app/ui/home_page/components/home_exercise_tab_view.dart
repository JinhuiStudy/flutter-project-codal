import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_codal/app/core/ui/core_ui.dart';
import 'package:flutter_codal/app/data/local/theme/theme_cubit.dart';
import 'package:flutter_codal/app/ui/components/codal_svg.dart';
import 'package:flutter_codal/app/ui/home_page/components/code_exam_container.dart';
import 'package:flutter_codal/app/ui/home_page/components/exam_level_box.dart';
import 'package:flutter_codal/app/ui/home_page/components/home_section_title.dart';

class HomeExerciseTabView extends StatefulWidget {
  const HomeExerciseTabView({Key? key}) : super(key: key);

  @override
  State<HomeExerciseTabView> createState() => _HomeExerciseTabViewState();
}

class _HomeExerciseTabViewState extends State<HomeExerciseTabView> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<ThemeCubit>().state.isDark;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          eHeight(14),
          ..._popularCodeTest(isDark),
          eHeight(35),
          HomeSectionTitle(text: '관련 문제', icon: 'clip', isSvg: false, onTap: () => null),
          eHeight(12),
          ...List.generate(2, (index) => Padding(
            padding: EdgeInsets.only(bottom: index == 1 ? 45 : 24),
            child: CodeExamContainer(title: '신비로운 유적 탐험', source: '2017 KAKAOCODE 본선', lang: ['a', 'a'], level: '달인'),
          )),
          HomeSectionTitle(text: '코달 추천 문제', icon: 'codal_icon', isSvg: true, onTap: () => null),
          eHeight(12),
          ...List.generate(3, (index) => Padding(
            padding: EdgeInsets.only(bottom: index == 2 ? 41 : 24),
            child: CodeExamContainer(title: '신비로운 유적 탐험', source: '2017 KAKAOCODE 본선', lang: ['a', 'a'], level: '달인'),
          )),
          eHeight(kBottomNavigationBarHeight),
        ],
      ),
    );
  }

  Widget _popularLabel(isDark){
    CustomTextStyle point = isDark ? Spoqa.textMainDark_s16_w700_h24 : Spoqa.textMain_s16_w700_h24;
    CustomTextStyle common = isDark ? Spoqa.textMainDark_s12_w400_h24 : Spoqa.textMain_s12_w400_h24;
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: '어제 가장 인기 있는 ', style: common),
          TextSpan(text: 'CODE TEST', style: point),
        ]
      )
    );
  }

  /// 색상 이름
  Widget _standardDateLabel(isDark, String date) => Text('기준 $date', style: isDark ? Spoqa.textSubDark_s10_w400_h10 : Spoqa.cFF767676_s10_w400_h10);

  Widget _testTitle(isDark, String title) => Text(title, style : isDark ? Spoqa.textMainDark_s20_w500_h20 : Spoqa.textMain_s20_w500_h20);

  /// 색상 이름
  Widget _testSource(isDark, String text) => Text(text, style: isDark ? Spoqa.textSubDark_s12_w500_h14 : Spoqa.cFF767676_s12_w500_h14);

  /// 수정하기 (lang만 위로가도록)
  Widget _langAndLevelRow(bool isDark){
    double maxWidth = (SizeHelper.deviceWidth - kHorizontalPadding*2) * 0.7;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Wrap(
            runSpacing: 8,
            verticalDirection: VerticalDirection.up,
            children: List.generate(3, (index) => Container(
              width: 24,
              height: 24,
              color: Colors.red,
              margin: const EdgeInsets.only(right: 13),
            ),),
          ),
        ),
        ExamLevelBox(
          width: 52,
          height: 24,
          level: '달인',
          textStyle: Spoqa.white_s12_w500_h14,
        ),
      ],
    );
  }

  Widget _testContent(bool isDark, String text) => Text(text, style: isDark ? Spoqa.textMainDark_s12_w400_h20 : Spoqa.textMain_s12_w400_h20);

  List<Widget> _popularCodeTest(isDark){
    String content = '얼마 전 소개팅에 실패해 낙담한 튜브를 안타깝게 여긴 친구들은튜브에게 새로운 사람을 소개해주기로 했다. 좀 더 자연스러운 자리를 만들기 위해, 튜브와 소개팅녀를 파티에 초대하기로 했다.';
    return [
      _popularLabel(isDark),
      eHeight(4),
      _standardDateLabel(isDark, '2022. 04. 19'),
      eHeight(20),
      _testTitle(isDark, '튜브의 소개팅'),
      eHeight(8),
      _testSource(isDark, '2017 KAKAOCODE 본선'),
      eHeight(12),
      _langAndLevelRow(isDark),
      eHeight(20),
      _testContent(isDark, content),
    ];
  }

  @override
  bool get wantKeepAlive => true;
}
