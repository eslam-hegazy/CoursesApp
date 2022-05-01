import 'package:flutter/material.dart';

import 'color_manager.dart';

ThemeData themeLight() {
  return ThemeData(
    scaffoldBackgroundColor: ColorLightManager.primaryColor,
    appBarTheme: AppBarTheme(
      color: ColorLightManager.primaryColor,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: ColorLightManager.blackColor,
      ),
    ),
  );
}

ThemeData themeDark() {
  return ThemeData(
    scaffoldBackgroundColor: ColorDarkManager.primaryColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorDarkManager.primaryColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: ColorLightManager.blackColor,
      ),
    ),
  );
}
