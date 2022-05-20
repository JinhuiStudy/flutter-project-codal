import 'package:flutter_codal/app/data/server/coding/coding_cubit.dart';

class CodingState {
  CodingState({this.isPopular = true, required this.codingList});

  bool isPopular;
  List<CodingDummy> codingList;

  CodingState copyWith({bool? isPopular, List<CodingDummy>? codingList}) {
    return CodingState(
      isPopular: isPopular ?? this.isPopular,
      codingList: codingList ?? this.codingList,
    );
  }
}
