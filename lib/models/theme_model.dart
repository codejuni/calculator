// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:calculator/themes/app_theme.dart';
import 'package:flutter/material.dart';

class ThemeModel {
  String title;
  ThemeData theme;

  ThemeModel({
    required this.title,
    required this.theme,
  });

  static List<ThemeModel> list = [
    ThemeModel(title: 'Light', theme: AppTheme.light),
    ThemeModel(title: 'Dark', theme: AppTheme.dark),
    ThemeModel(title: 'Night Blue', theme: AppTheme.nightBlue),
  ];
}
