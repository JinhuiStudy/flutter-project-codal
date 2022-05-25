import 'package:flutter_codal/app/data/server/coding/coding_cubit.dart';

class CodingState {
  CodingState({
    this.isPopular = true,
    required this.codingList,
    required this.firstDropList,
    required this.secondDropList,
    this.firstSelectedItem = '',
    this.secondSelectedItem = '',
  });

  bool isPopular;
  List<CodingDummy> codingList;

  String firstSelectedItem;
  String secondSelectedItem;

  List<DropDummy> firstDropList;
  List<DropDummy> secondDropList;

  CodingState copyWith({
    bool? isPopular,
    List<CodingDummy>? codingList,
    List<DropDummy>? firstDropList,
    List<DropDummy>? secondDropList,
    String? firstSelectedItem,
    String? secondSelectedItem,
  }) {
    return CodingState(
      isPopular: isPopular ?? this.isPopular,
      codingList: codingList ?? this.codingList,
      firstDropList: firstDropList ?? this.firstDropList,
      secondDropList: secondDropList ?? this.secondDropList,
      firstSelectedItem: firstSelectedItem ?? this.firstSelectedItem,
      secondSelectedItem: secondSelectedItem ?? this.secondSelectedItem,
    );
  }
}
