import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_codal/app/core/ui/core_ui.dart';
import 'package:flutter_codal/app/data/local/theme/theme_cubit.dart';
import 'package:flutter_codal/app/data/server/home/like_cubit.dart';
import 'package:flutter_codal/app/ui/components/codal_svg.dart';

class PostContainer extends StatelessWidget {
  const PostContainer({
    Key? key,
    required this.id,
    required this.subject,
    required this.title,
    this.profileUrl,
    this.username,
    this.term,
    required this.likeCount,
    required this.replyCount,
    required this.isLike,
    this.onTap,
    this.isNews = false,
  }) : super(key: key);

  final int id;
  final String subject;
  final String title;
  final String? profileUrl;
  final String? username;
  final String? term;
  final bool isLike;
  final int likeCount;
  final int replyCount;
  final bool isNews;
  final Function()? onTap;

  Widget _row(bool isDark) {
    return Builder(builder: (context) {
      final likeState = context.watch<LikeCubit>().state;
      return Row(
        children: [
          if (!isNews) ...[
            Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
            eWidth(8),
            Flexible(
                child: Text(
              username ?? '',
              style: isDark
                  ? Spoqa.textMainDark_s11_w500_h11
                  : Spoqa.textMain_s11_w500_h11,
              overflow: TextOverflow.ellipsis,
            )),
            eWidth(4),
            Text(term ?? '',
                style: isDark
                    ? Spoqa.textSubDark_s10_w400_h10
                    : Spoqa.textSub_s10_w400_h10),
            eWidth(9),
          ],
          GestureDetector(
            onTap: () {
              context.read<LikeCubit>().clickLikeBtn(postIdx: id);
            },
            child: CodalSvg(fileName: likeState.isLike ? 'heart_on' : 'heart_off'),
          ),
          eWidth(4),
          Text('${likeState.likeCount}',
              style: isDark
                  ? Spoqa.textSubDark_s10_w400_h10
                  : Spoqa.textSub_s10_w400_h10),
          eWidth(10),
          const CodalSvg(fileName: 'reply'),
          eWidth(4),
          Text('$replyCount',
              style: isDark
                  ? Spoqa.textSubDark_s10_w400_h10
                  : Spoqa.textSub_s10_w400_h10),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<ThemeCubit>().state.isDark;
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => LikeCubit(isLike: isLike, likeCount: likeCount))],
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(subject,
                  style: isDark
                      ? Spoqa.textSubDark_s10_w500_h10
                      : Spoqa.textSub_s10_w500_h10),
              eHeight(6),
              Text(title,
                  style: isDark
                      ? Spoqa.textMainDark_s13_w400_h16
                      : Spoqa.textMain_s13_w400_h16),
              eHeight(4),
              _row(isDark),
            ],
          ),
        ),
      ),
    );
  }
}
