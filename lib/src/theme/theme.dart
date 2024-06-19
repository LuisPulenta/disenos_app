import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;
  ThemeData _currentTheme = ThemeData.light();

  bool get darkTheme => this._darkTheme;
  bool get customTheme => this._customTheme;
  ThemeData get currentTheme => this._currentTheme;

  ThemeChanger(int theme) {
    switch (theme) {
      case 1: //ligth
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light().copyWith(
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: Colors.pink));
        ;
        break;

      case 2: //dark
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
        break;

      case 3: //ligth
        _darkTheme = false;
        _customTheme = true;
        break;

      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light().copyWith(
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: Colors.pink));
        ;
        break;
    }
  }

  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;
    if (value) {
      _currentTheme = ThemeData.dark();
    } else {
      _currentTheme = ThemeData.light().copyWith(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.pink));
      ;
    }
    notifyListeners();
  }

  set customTheme(bool value) {
    _darkTheme = false;
    _customTheme = value;
    if (value) {
      _currentTheme = ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.pink),
        primaryColor: Colors.white,
        scaffoldBackgroundColor: const Color(0xff16202b),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.yellowAccent),
        ),
      );
    } else {
      _currentTheme = ThemeData.light().copyWith(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.pink));
      ;
    }
    notifyListeners();
  }
}
