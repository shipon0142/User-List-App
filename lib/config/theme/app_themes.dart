import 'package:flutter/material.dart';

import '../../core/utility/constants/color_manager.dart';
import '../../core/utility/constants/font_manager.dart';
import '../../core/utility/constants/style_manager.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorManager.kColorWhite,
    fontFamily: 'Inter',
    appBarTheme: appBarTheme()
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: ColorManager.kColorWhite,
    elevation: 0,
    centerTitle: true,
    iconTheme: const IconThemeData(color: Color(0XFF8B8B8B)),
    titleTextStyle: getRegularStyle(color: const Color(0XFF8B8B8B), fontSize: FontSize.s18),
  );
}