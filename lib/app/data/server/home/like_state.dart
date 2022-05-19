class LikeState {
  LikeState({required this.isLike, required this.likeCount});

  bool isLike;
  int likeCount;

  LikeState copyWith({bool? isLike, int? likeCount}) {
    return LikeState(
      isLike: isLike ?? this.isLike,
      likeCount: likeCount ?? this.likeCount,
    );
  }
}
