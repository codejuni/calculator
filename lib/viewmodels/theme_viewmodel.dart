import 'package:calculator/models/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeViewModel extends ChangeNotifier {
  final List<ThemeModel> _themes = ThemeModel.list;
  List<ThemeModel> get themes => _themes;
  ThemeData get theme => _themes[_indexTheme].theme;

  int _indexTheme = 0;
  int get indexTheme => _indexTheme;

  void init() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _indexTheme = preferences.getInt('theme') ?? 0;
    notifyListeners();
  }

  void changeTheme(int index) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('theme', index);
    _indexTheme = index;
    notifyListeners();
  }
}
