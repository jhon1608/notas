import 'package:flutter/material.dart';

import 'package:notas/app/theme/them_light.dart';
import 'package:notas/app/theme/theme_dark.dart';

class AppTheme {
  static bool inicialTheme =
      WidgetsBinding.instance!.window.platformBrightness == Brightness.dark;
  static bool dark() {
    bool act =
        WidgetsBinding.instance!.window.platformBrightness == Brightness.dark;
    if (inicialTheme != act) {
      inicialTheme = act;
    }

    return act;
  }

  MaterialColor themeApp = !dark() ? ThemeLight.themeApp : ThemeDark.themeApp;

  Color colorAppBar = !dark() ? ThemeLight.colorAppBar : ThemeDark.colorAppBar;
  Color colorNote = !dark() ? ThemeLight.colorNote : ThemeDark.colorNote;
  Color colorNoteBackground =
      !dark() ? ThemeLight.colorNoteBackground : ThemeDark.colorNoteBackground;
  //Button
  Color colorButton = !dark() ? ThemeLight.colorButton : ThemeDark.colorButton;
  Color colorButtonText =
      !dark() ? ThemeLight.colorButtonText : ThemeDark.colorButtonText;

  //Text
  Color colorText = !dark() ? ThemeLight.colorText : ThemeDark.colorText;
  Color colorTextMin =
      !dark() ? ThemeLight.colorTextMin : ThemeDark.colorTextMin;

  //Icons
  Color colorIconRemove =
      !dark() ? ThemeLight.colorIconRemove : ThemeLight.colorIconRemove;
  Color colorIconCheck =
      !dark() ? ThemeLight.colorIconCheck : ThemeLight.colorIconCheck;
  Color colorIconEdit =
      !dark() ? ThemeLight.colorIconEdit : ThemeLight.colorIconEdit;

  //Size text
  double sizePrimaryTitle = 25.0;
  double sizeTitle = 20.0;
  double sizeText = 15.0;
  static AppTheme instance = AppTheme();
}
