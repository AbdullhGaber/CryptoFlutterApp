import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_2/core/theme/mode/cubit/theme_states.dart';
import '../app_theme.dart';

class ThemeCubit extends Cubit<ThemeStates> {
  ThemeCubit() : super(ThemeInitState());

  bool _isDark = true;

  ThemeData get themeData => _isDark ? AppTheme.darkTheme : AppTheme.lightTheme;

  bool get isDarkMode => _isDark;

  void toggleTheme() {
    _isDark = !_isDark;
    emit(ThemeUpdateState());
  }
}
