import 'package:assessili_assement_app/config/Theme/tehem_extension.dart';
import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  fontFamily: 'TitilliumWeb',
  extensions: const <ThemeExtension<dynamic>>[
    GradientColors(
      primaryGradient: LinearGradient(
        colors: [
          Color(0xff70ae57),
          Color(0xff54a985),
          Color(0xff4ab196),
          Color(0xff48a998)
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      buttonGradient: LinearGradient(
        colors: [Colors.white, Colors.white],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      transparentGradient: LinearGradient(
        colors: [Colors.transparent, Colors.transparent],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
    ),
  ],
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFF603DC8),
  ),
  dividerColor: Colors.black,
  brightness: Brightness.light,
  highlightColor: Colors.white,
  hintColor: const Color(0xFF9E9E9E),
  scaffoldBackgroundColor: const Color.fromARGB(255, 53, 65, 73),
  splashColor: Colors.transparent,
  canvasColor: const Color(0xff08D4EE),
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF603DC8),
    secondary: Color(0xFF004C8E),
    tertiary: Color(0xFFF9D4A8),
    tertiaryContainer: Color(0xFFADC9F3),
    onTertiaryContainer: Color(0xFF33AF74),
    onPrimary: Color(0xFF7FBBFF),
    error: Color(0xFFFF5555),
    onSecondaryContainer: Color(0xFFF3F9FF),
    outline: Color(0xff2C66B4),
    onTertiary: Color(0xFFE9F3FF),
    primaryContainer: Color(0xFF9AECC6),
    secondaryContainer: Color(0xFFF2F2F2),
  ),
);
