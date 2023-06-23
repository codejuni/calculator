import 'package:calculator/themes/app_colors.dart';
import 'package:calculator/viewmodels/calculator_viewmodel.dart';
import 'package:calculator/viewmodels/drawer_viewmodel.dart';
import 'package:calculator/viewmodels/theme_viewmodel.dart';
import 'package:flutter/material.dart';

class CalculatorDrawer extends StatelessWidget {
  const CalculatorDrawer({
    super.key,
    required this.themeController,
    required this.calculatorController,
    required this.drawerController,
  });

  final ThemeViewModel themeController;
  final CalculatorViewModel calculatorController;
  final DrawerViewModel drawerController;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizeWidth = size.width * 0.7;
    return Drawer(
      width: sizeWidth,
      child: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedContainer(
            width: sizeWidth,
            duration: const Duration(milliseconds: 600),
            transform: Matrix4.translationValues(
              drawerController.stateDrawer ? -sizeWidth : 0,
              0,
              0,
            ),
            child: Column(
              children: [
                AppBar(
                  leading: const SizedBox.shrink(),
                  title: const Text('Menú'),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text('History'),
                          onTap: () {
                            drawerController.changeStateDrawer(0);
                          },
                        ),
                        ListTile(
                          title: const Text('Themes'),
                          onTap: () {
                            /* Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ThemeScreen(),
                                )); */
                            drawerController.changeStateDrawer(1);
                          },
                          trailing: Text(
                            themeController
                                .themes[themeController.indexTheme].title,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: AppColors.hint,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          AnimatedContainer(
            width: sizeWidth,
            duration: const Duration(milliseconds: 600),
            transform: Matrix4.translationValues(
              drawerController.stateDrawer ? 0 : sizeWidth,
              0,
              0,
            ),
            child: Column(
              children: [
                AppBar(
                  leading: BackButton(
                    onPressed: () {
                      drawerController
                          .changeStateDrawer(drawerController.pageDrawer);
                    },
                  ),
                  title: Text(title()),
                ),
                Expanded(child: body()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String title() {
    switch (drawerController.pageDrawer) {
      case 0:
        return 'History';
      case 1:
        return 'Themes';
      default:
        return '';
    }
  }

  Widget body() {
    switch (drawerController.pageDrawer) {
      case 0:
        return ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(height: 15);
          },
          padding: const EdgeInsets.symmetric(vertical: 15),
          itemCount: calculatorController.listHistory.length,
          itemBuilder: (context, index) {
            String history = calculatorController.listHistory[index];
            return ListTile(
              title: Text(
                history,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () {
                calculatorController.getHistory(index);
                Navigator.pop(context);
              },
            );
          },
        );
      case 1:
        return ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(height: 15);
          },
          padding: const EdgeInsets.symmetric(vertical: 15),
          itemCount: themeController.themes.length,
          itemBuilder: (context, index) {
            final theme = themeController.themes[index];
            return SwitchListTile(
              tileColor: index == themeController.indexTheme
                  ? Theme.of(context).hintColor
                  : Colors.transparent,
              title: Text(theme.title),
              value: index == themeController.indexTheme,
              onChanged: (value) {
                themeController.changeTheme(index);
              },
            );
          },
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
