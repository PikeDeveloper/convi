import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  int _currentTab = 0;
  int get currentTab => _currentTab;
  set currentTab(int currentTab) {
    _currentTab = currentTab;
    notifyListeners();
  }
}
