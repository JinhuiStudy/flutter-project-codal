import 'package:flutter_codal/app/data/server/home/home_cubit.dart';

class HomeState {
  HomeState({this.isPopularPost = true, this.isPopularNews = true, required this.postList});

  bool isPopularPost;
  bool isPopularNews;

  List<PostDummy> postList;

  HomeState copyWith({bool? isPopularPost, bool? isPopularNews, List<PostDummy>? postList}) {
    return HomeState(
      isPopularPost: isPopularPost ?? this.isPopularPost,
      isPopularNews: isPopularNews ?? this.isPopularNews,
      postList: postList ?? this.postList,
    );
  }
}