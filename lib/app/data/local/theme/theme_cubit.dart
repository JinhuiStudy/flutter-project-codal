import 'package:bloc/bloc.dart';
import 'package:flutter_codal/app/data/local/theme/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({required bool isDark}) : super(ThemeState(isDark: isDark));

  void changeTheme({required bool isDark}) {
    // TODO local storage 저장
    emit(ThemeState(isDark: isDark));
  }
}
