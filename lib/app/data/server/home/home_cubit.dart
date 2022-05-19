import 'package:bloc/bloc.dart';
import 'package:flutter_codal/app/data/server/home/home_state.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit() : super(HomeState(postList: []));

  void postFilter({required bool isPopular}){
    /// post list 변경
    emit(state.copyWith(isPopularPost: isPopular));
  }

  void newsFilter({required bool isPopular}){
    /// news list 변경
    emit(state.copyWith(isPopularNews: isPopular));
  }

  void getData(){
    List<PostDummy> list = [];
    for(int i = 1 ; i < 6 ; i++){
      list.add(PostDummy(id: i, title: 'title$i', subject: 'subject$i', imageUrl: '', username: 'user$i', term: '${5*i}일 전', likeCount: 100, isLike: false, replyCount: 100));
    }
    emit(state.copyWith(postList: list));
  }
}

class PostDummy {
  final int id;
  final String title;
  final String subject;
  final String imageUrl;
  final String username;
  final String term;
  final int likeCount;
  final bool isLike;
  final int replyCount;

  PostDummy({required this.id, required this.title, required this.subject, required this.imageUrl,
    required this.username, required this.term, required this.likeCount, required this.isLike, required this.replyCount});
}