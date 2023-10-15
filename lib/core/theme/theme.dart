import 'package:flutter/material.dart';

import '../../constanse/colors.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  canvasColor: lightBackground,
  colorScheme: const ColorScheme.light(
    background: lightBackground,
    primary: Colors.black,
    secondary: darkJungleGreen,
    tertiary: azureishWhite,
    secondaryContainer: jasmine,
    surface: brightGray,
    surfaceVariant: spanishGrayL,
    inverseSurface: silverSand,
    inversePrimary: bottomSheetLight,
    surfaceTint: brightGray2,
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  canvasColor: darkBackground,
  colorScheme: const ColorScheme.dark(
    background: darkBackground,
    primary: Colors.white,
    secondary: azureishWhite,
    tertiary: darkJungleGreen,
    secondaryContainer: gold,
    surface: charlestonGreen,
    surfaceVariant: spanishGray,
    inverseSurface: quartz,
    inversePrimary: bottomSheetDark,
    surfaceTint: eerieBlack,
  ),
);
