import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_codal/app/core/ui/core_ui.dart';
import 'package:flutter_codal/app/data/local/theme/theme_cubit.dart';
import 'package:flutter_codal/app/data/server/home/home_cubit.dart';
import 'package:flutter_codal/app/ui/components/codal_svg.dart';
import 'package:flutter_codal/app/ui/home_page/components/home_section_title.dart';
import 'package:flutter_codal/app/ui/home_page/components/post_container.dart';

class HomeCommunityTabView extends StatefulWidget {
  const HomeCommunityTabView({Key? key}) : super(key: key);

  @override
  State<HomeCommunityTabView> createState() => _HomeCommunityTabViewState();
}

class _HomeCommunityTabViewState extends State<HomeCommunityTabView> with AutomaticKeepAliveClientMixin {
  Widget _filterRow(bool isPost) {
    return Builder(builder: (context) {
      final homeState = context.watch<HomeCubit>().state;
      bool isDark = context.watch<ThemeCubit>().state.isDark;
      bool isPopular =
          isPost ? homeState.isPopularPost : homeState.isPopularNews;
      CustomTextStyle disableStyle =
          isDark ? Spoqa.textSubDark_s12_w400_h20 : Spoqa.textSub_s12_w400_h20;
      CustomTextStyle enableStyle = isDark
          ? Spoqa.textMainDark_s12_w400_h20
          : Spoqa.textMain_s12_w400_h20;

      return Row(
        children: [
          GestureDetector(
            onTap: () {
              if (isPost) {
                context.read<HomeCubit>().postFilter(isPopular: true);
              } else {
                context.read<HomeCubit>().newsFilter(isPopular: true);
              }
            },
            child: Container(
              color: Colors.transparent,
              child: Row(
                children: [
                  Container(
                    width: 11,
                    height: 13.98,
                    child: CodalSvg(fileName: isPopular ? 'popular_on' : 'popular_off'),
                  ),
                  eWidth(2.5),
                  Text('인기 순', style: isPopular ? enableStyle : disableStyle),
                ],
              ),
            ),
          ),
          eWidth(11.5),
          GestureDetector(
            onTap: () {
              if (isPost) {
                context.read<HomeCubit>().postFilter(isPopular: false);
              } else {
                context.read<HomeCubit>().newsFilter(isPopular: false);
              }
            },
            child: Container(
              color: Colors.transparent,
              child: Row(
                children: [
                  Container(
                    width: 13.23,
                    height: 16,
                    child: CodalSvg(fileName: isPopular ? 'recent_off' : 'recent_on'),
                  ),
                  eWidth(2.5),
                  Text('최신 순', style: isPopular ? disableStyle : enableStyle),
                ],
              ),
            ),
          )
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final postList = context.watch<HomeCubit>().state.postList;
    const countMax = 5;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          eHeight(14),
          HomeSectionTitle(
              text: '인기_Post', icon: 'fire', isSvg: false, onTap: () => null),
          eHeight(18),
          _filterRow(true),
          eHeight(14),
          ...List.generate(
              postList.length > countMax ? countMax : postList.length,
              (index) => Padding(
                    padding: EdgeInsets.only(bottom: index == countMax - 1 ? 34 : 20),
                    child: PostContainer(
                      id: postList[index].id,
                      subject: postList[index].subject,
                      title: postList[index].title,
                      profileUrl: postList[index].imageUrl,
                      username: postList[index].username,
                      term: postList[index].term,
                      likeCount: postList[index].likeCount,
                      replyCount: postList[index].replyCount,
                      isLike: postList[index].isLike,
                    ),
                  )),
          HomeSectionTitle(
              text: '업데이트_News',
              icon: 'setting',
              isSvg: false,
              onTap: () => null),
          eHeight(18),
          _filterRow(false),
          eHeight(14),
          ...List.generate(
              5,
              (index) => Padding(
                    padding: EdgeInsets.only(bottom: index == 4 ? 34 : 20),
                    child: PostContainer(
                        id: 1,
                        subject: 'Flutter',
                        title: 'Flutter 3 출시 정보',
                        likeCount: 129,
                        replyCount: 310,
                        isLike: false,
                        isNews: true),
                  )),
          eHeight(kBottomNavigationBarHeight),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
