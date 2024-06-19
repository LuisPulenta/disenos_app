import 'package:flutter/material.dart';
import 'package:disenos_app/src/pages/pages.dart';

class LayoutModel with ChangeNotifier {
  Widget _currentPage = const SlideshowPage();

  set currentPage(Widget page) {
    _currentPage = page;
    notifyListeners();
  }

  Widget get currentPage => _currentPage;
}
