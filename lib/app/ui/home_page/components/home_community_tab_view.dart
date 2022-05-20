import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_codal/app/core/ui/core_ui.dart';
import 'package:flutter_codal/app/data/local/theme/theme_cubit.dart';
import 'package:flutter_codal/app/data/server/home/home_cubit.dart';
import 'package:flutter_codal/app/ui/components/codal_svg.dart';
import 'package:flutter_codal/app/ui/components/popular_recent_filter.dart';
import 'package:flutter_codal/app/ui/home_page/components/home_section_title.dart';
import 'package:flutter_codal/app/ui/home_page/components/post_container.dart';

class HomeCommunityTabView extends StatefulWidget {
  const HomeCommunityTabView({Key? key}) : super(key: key);

  @override
  State<HomeCommunityTabView> createState() => _HomeCommunityTabViewState();
}

class _HomeCommunityTabViewState extends State<HomeCommunityTabView> with AutomaticKeepAliveClientMixin {
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
          Builder(builder: (context) {
            final homeState = context.watch<HomeCubit>().state;
            return PopularRecentFilter(
              isPopular: homeState.isPopularPost,
              popularTap: () => context.read<HomeCubit>().postFilter(isPopular: true),
              recentTap: () => context.read<HomeCubit>().postFilter(isPopular: false),
            );
          }),
          eHeight(14),
          ...List.generate(
              postList.length > countMax ? countMax : postList.length,
              (index) => Padding(
                    padding: EdgeInsets.only(
                        bottom: index == countMax - 1 ? 34 : 20),
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
          Builder(builder: (context) {
            final homeState = context.watch<HomeCubit>().state;
            return PopularRecentFilter(
              isPopular: homeState.isPopularNews,
              popularTap: () => context.read<HomeCubit>().newsFilter(isPopular: true),
              recentTap: () => context.read<HomeCubit>().newsFilter(isPopular: false),
            );
          }),
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
