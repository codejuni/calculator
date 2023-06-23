import 'package:flutter/material.dart';

class DrawerViewModel extends ChangeNotifier {
  bool _stateDrawer = false;
  bool get stateDrawer => _stateDrawer;

  int _pageDrawer = 0;
  int get pageDrawer => _pageDrawer;

  void changeStateDrawer(int page) {
    _stateDrawer = !_stateDrawer;
    _pageDrawer = page;
    notifyListeners();
  }
}
