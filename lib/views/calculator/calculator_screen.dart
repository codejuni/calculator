import 'package:calculator/viewmodels/calculator_viewmodel.dart';
import 'package:calculator/viewmodels/drawer_viewmodel.dart';
import 'package:calculator/viewmodels/theme_viewmodel.dart';
import 'package:calculator/views/calculator/calculator_body.dart';
import 'package:calculator/views/calculator/calculator_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CalculatorViewModel>(context);
    final themeController = Provider.of<ThemeViewModel>(context);
    final drawerController = Provider.of<DrawerViewModel>(context);

    return Scaffold(
      drawer: CalculatorDrawer(
        themeController: themeController,
        calculatorController: controller,
        drawerController: drawerController,
      ),
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Theme.of(context).cardColor,
      ),
      body: CalculatorBody(controller: controller),
    );
  }
}
