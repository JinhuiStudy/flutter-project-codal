import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_codal/app/data/server/home/like_state.dart';

class LikeCubit extends Cubit<LikeState> {
  LikeCubit({required bool isLike, required int likeCount}) : super(LikeState(isLike: isLike, likeCount: likeCount));

  /// 통신
  void clickLikeBtn({required int postIdx}){
    if(state.isLike){
      emit(state.copyWith(isLike: false, likeCount: state.likeCount - 1));
    } else {
      emit(state.copyWith(isLike: true, likeCount: state.likeCount + 1));
    }
  }

}