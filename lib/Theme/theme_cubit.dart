import 'package:any_wash/Theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  final bool isDark;
  ThemeCubit(this.isDark) : super(isDark ? darkTheme : appTheme);

  void selectLightTheme() {
    emit(appTheme);
  }

  void selectDarkTheme() {
    emit(darkTheme);
  }
}
