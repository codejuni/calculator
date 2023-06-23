import 'package:calculator/viewmodels/calculator_viewmodel.dart';
import 'package:calculator/viewmodels/drawer_viewmodel.dart';
import 'package:calculator/viewmodels/theme_viewmodel.dart';
import 'package:calculator/views/calculator/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeViewModel()..init(),
        ),
        ChangeNotifierProvider(
          create: (context) => CalculatorViewModel()..init(),
        ),
        ChangeNotifierProvider(
          create: (context) => DrawerViewModel(),
        ),
      ],
      child: Consumer<ThemeViewModel>(
        builder: (context, value, child) {
          if (value.themes.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: value.theme,
            themeMode: ThemeMode.system,
            themeAnimationCurve: Curves.decelerate,
            themeAnimationDuration: const Duration(milliseconds: 2000),
            home: const CalculatorScreen(),
          );
        },
      ),
    );
  }
}
