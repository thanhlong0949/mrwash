import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageCubit extends Cubit<Locale> {
  final String? locale;
  LanguageCubit(this.locale)
      : super(locale != null ? Locale(locale) : Locale('en'));

  void selectEngLanguage() {
    emit(Locale('en'));
  }

  void selectVietnameseLanguage() {
    emit(Locale('vn'));
  }
}
