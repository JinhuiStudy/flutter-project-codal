import 'package:bloc/bloc.dart';
import 'package:flutter_codal/app/data/server/coding/coding_state.dart';

class CodingCubit extends Cubit<CodingState>{
  CodingCubit() : super(CodingState(codingList: []));

  void filter({required bool isPopular}){
    emit(state.copyWith(isPopular: isPopular));
  }

  void getData(){
    List<CodingDummy> list = [];
    for(int i = 1 ; i< 6 ; i++){
      list.add(CodingDummy(id: i, title: 'title$i', source: 'source$i', lang: [LangDummy(id: 1, name: 'name', imageUrl: 'imageUrl'),LangDummy(id: 2, name: 'name', imageUrl: 'imageUrl')], level: '달인'));
    }
    List<CodingDummy> temp = state.codingList;
    temp.addAll(list);
    emit(state.copyWith(codingList: temp));
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