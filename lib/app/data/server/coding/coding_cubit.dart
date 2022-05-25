import 'package:bloc/bloc.dart';
import 'package:flutter_codal/app/data/server/coding/coding_state.dart';

class CodingCubit extends Cubit<CodingState>{
  CodingCubit() : super(CodingState(codingList: [], secondDropList: [], firstDropList: []));

  void filter({required bool isPopular}){
    /// 인기순 최신순 리스트 받기
    emit(state.copyWith(isPopular: isPopular));
  }

  void firstDropChange(String value){
    emit(state.copyWith(firstSelectedItem: value));
  }

  void secondDropChange(String value){
    emit(state.copyWith(secondSelectedItem: value));
  }

  /// 임시
  void getData(){
    List<CodingDummy> list = [];
    for(int i = 1 ; i< 6 ; i++){
      list.add(CodingDummy(id: i, title: 'title$i', source: 'source$i', lang: [LangDummy(id: 1, name: 'name', imageUrl: 'imageUrl'),LangDummy(id: 2, name: 'name', imageUrl: 'imageUrl')], level: '달인'));
    }
    List<DropDummy> firstDropList = [];
    List<DropDummy> secondDropList = [];
    for(int i = 1 ; i<4 ; i++){
      firstDropList.add(DropDummy(id: i, title: 'first$i'));
      secondDropList.add(DropDummy(id: i, title: 'second$i'));
    }

    List<CodingDummy> temp = state.codingList;
    temp.addAll(list);
    emit(state.copyWith(firstSelectedItem: firstDropList.first.title));
    emit(state.copyWith(secondSelectedItem: secondDropList.first.title));
    emit(state.copyWith(codingList: temp));
    emit(state.copyWith(firstDropList: firstDropList));
    emit(state.copyWith(secondDropList: secondDropList));
  }

}


class CodingDummy {
  final int id;
  final String title;
  final String source;
  final List<LangDummy> lang;
  final String level;

  CodingDummy({required this.id, required this.title, required this.source, required this.lang, required this.level});
}

class LangDummy {
  final int id;
  final String name;
  final String imageUrl;

  LangDummy({required this.id, required this.name, required this.imageUrl});
}

class DropDummy {
  final int id;
  final String title;

  DropDummy({required this.id, required this.title});
}