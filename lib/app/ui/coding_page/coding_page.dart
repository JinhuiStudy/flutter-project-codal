import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_codal/app/core/ui/core_ui.dart';
import 'package:flutter_codal/app/data/local/theme/theme_cubit.dart';
import 'package:flutter_codal/app/data/server/coding/coding_cubit.dart';
import 'package:flutter_codal/app/ui/coding_page/components/custom_drop_down.dart';
import 'package:flutter_codal/app/ui/coding_page/components/filter_box.dart';
import 'package:flutter_codal/app/ui/components/codal_svg.dart';
import 'package:flutter_codal/app/ui/components/popular_recent_filter.dart';
import 'package:flutter_codal/app/ui/home_page/components/code_exam_container.dart';

class CodingPage extends StatelessWidget {
  const CodingPage({Key? key}) : super(key: key);

  Widget _title() {
    return Builder(builder: (context) {
      bool isDark = context.watch<ThemeCubit>().state.isDark;
      CustomTextStyle style = isDark
          ? Spoqa.textMainDark_s20_w700_h20
          : Spoqa.textMain_s20_w700_h20;
      return Row(
        children: [
          Text('코달_Coding', style: style),
          eWidth(6),
          SizedBox(
            width: 21.45,
            height: 20,
            child: Image.asset('assets/png/computer.png'),
          ),
        ],
      );
    });
  }

  Widget _firstFilter() {
    return Builder(
        builder: (context) {
          bool isDark = context.watch<ThemeCubit>().state.isDark;
          final codingState = context.watch<CodingCubit>().state;
          return Row(
            children: [
              Expanded(
                child: CustomDropDown(
                  itemList: codingState.firstDropList.map((e) => e.title).toList(),
                  selectedItem: codingState.firstSelectedItem,
                  isDark: isDark,
                  onChange: (String value) {  },
                ),
              ),
              // Expanded(
              //   child: DropdownButton(
              //       isExpanded: true,
              //       icon: CodalSvg(fileName: 'keyboard_arrow_bottom'),
              //
              //       value: codingState.firstSelectedItem,
              //       items: codingState.firstDropList.map((e) => DropdownMenuItem(value : e.title, child: Text(e.title, style: isDark ? Spoqa.textTabEnableDark_s16_w500_h16 : Spoqa.textTabEnable_s16_w500_h16,))).toList(),
              //       onChanged: (value){
              //         context.read<CodingCubit>().firstDropChange(value.toString());
              //       }
              //   ),
              // ),
              eWidth(18),
              Expanded(
                child: CustomDropDown(
                  itemList: [''],
                  selectedItem: 'selectItem',
                  isDark: isDark,
                  onChange: (String value) {  },
                ),
              ),
              eWidth(9),
              Text('.JS', style: isDark ? Spoqa.textTabEnableDark_s14_w500_h14 : Spoqa.textTabEnable_s14_w500_h14,),
              eWidth(16),
            ],
          );
        }
    );
  }

  Widget _secondFilter() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(
              3,
                  (index) => FilterBox(label: '달인', onTap: () => null),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            print('click filter');
          },
          child: const SizedBox(
            width: 24,
            height: 24,
            child: CodalSvg(fileName: 'filter'),
          ),
        ),
        eWidth(12)
      ],
    );
  }

  Widget _thirdFilter() {
    return Builder(builder: (context) {
      final codingState = context.watch<CodingCubit>().state;
      return PopularRecentFilter(
        isPopular: codingState.isPopular,
        popularTap: () => context.read<CodingCubit>().filter(isPopular: true),
        recentTap: () => context.read<CodingCubit>().filter(isPopular: false),
      );
    });
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          eHeight(11),
          _title(),
          eHeight(31),
          _firstFilter(),
          eHeight(12),
          _secondFilter(),
          eHeight(16),
          _thirdFilter(),
          eHeight(14),
        ],
      ),
    );
  }

  /// TODO 무한스크롤 구현하기
  Widget _refreshListView() {
    return Builder(builder: (context) {
      List<CodingDummy> items = context.watch<CodingCubit>().state.codingList;
      return _listView(items: items);
    });
  }

  Widget _listView({required List<CodingDummy> items}) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      children: [
        ...List.generate(
            items.length,
                (index) => Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: CodeExamContainer(
                  title: items[index].title,
                  source: items[index].source,
                  lang: items[index].lang.map((e) => e.imageUrl).toList(),
                  level: items[index].level),
            )),
        eHeight(kBottomNavigationBarHeight),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CodingCubit>(
            create: (context) => CodingCubit()..getData()),
      ],
      child: Column(
        children: [
          _header(),
          Expanded(child: _refreshListView()),
        ],
      ),
    );
  }
}
