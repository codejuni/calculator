import 'package:calculator/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final light = ThemeData(
    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.white,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(7),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black,
        size: 18,
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    cardColor: AppColors.scaffold,
    shadowColor: Colors.black12,
    textTheme: TextTheme(
      titleMedium: const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        color: AppColors.hint,
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    ),
    listTileTheme: const ListTileThemeData(
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  static final dark = ThemeData(
    drawerTheme: DrawerThemeData(
      backgroundColor: AppColors.dark,
      shadowColor: Colors.white12,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(7),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.dark,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      elevation: 0,
      iconTheme: const IconThemeData(
        color: Colors.white,
        size: 18,
      ),
    ),
    scaffoldBackgroundColor: AppColors.dark,
    cardColor: AppColors.dark,
    shadowColor: Colors.white12,
    textTheme: TextTheme(
      titleMedium: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        color: AppColors.hint,
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: const TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    ),
    listTileTheme: const ListTileThemeData(
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  static final nightBlue = ThemeData(
    drawerTheme: DrawerThemeData(
      backgroundColor: AppColors.lightNightBlue,
      shadowColor: Colors.white12,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(7),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkNightBlue,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      elevation: 0,
      iconTheme: const IconThemeData(
        color: Colors.white,
        size: 18,
      ),
    ),
    scaffoldBackgroundColor: AppColors.darkNightBlue,
    cardColor: AppColors.lightNightBlue,
    shadowColor: Colors.white24,
    textTheme: TextTheme(
      titleMedium: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        color: AppColors.hint,
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: const TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    ),
    listTileTheme: const ListTileThemeData(
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
