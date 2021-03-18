import 'package:flutter/material.dart';
import 'theme.dart';



class DarkModeModel extends ChangeNotifier {

  final List<ThemeDefine> themes = [
    ThemeDefine(main:Colors.black,secondary:Colors.grey[900],text:Colors.white,accent:Colors.lightGreenAccent),
    ThemeDefine(main:Colors.white,secondary:Colors.grey[300],text:Colors.grey[900],accent:Colors.blue[800]),
  ];

  ThemeDefine chosenTheme = ThemeDefine(main:Colors.white,secondary:Colors.grey[300],text:Colors.grey[900],accent:Colors.blue[800]);

  void setTheme(bool isSwitched) {
    if (isSwitched) {
      chosenTheme = themes[0];
    } else {
      chosenTheme = themes[1];
    }
    notifyListeners();
  }

}