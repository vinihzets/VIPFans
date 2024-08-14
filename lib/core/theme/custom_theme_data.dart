import 'package:flutter/material.dart';

class CustomThemeData {
  static Color transmeetBlue = const Color.fromRGBO(47, 55, 72, 1.0);

  static ThemeData darkTheme = ThemeData(
    textTheme: const TextTheme(
        labelSmall: TextStyle(
      color: Colors.white,
    )),
    useMaterial3: true,
    appBarTheme: AppBarTheme(backgroundColor: transmeetBlue),
    popupMenuTheme: const PopupMenuThemeData(),
    brightness: Brightness.dark,
    switchTheme: const SwitchThemeData(
      trackOutlineWidth: MaterialStatePropertyAll(0.1),
      trackColor: MaterialStatePropertyAll(Color.fromRGBO(47, 55, 72, 1.0)),
      trackOutlineColor:
          MaterialStatePropertyAll(Color.fromRGBO(47, 55, 72, 1.0)),
    ),
    tooltipTheme: TooltipThemeData(
        preferBelow: false,
        decoration: BoxDecoration(
            color: Colors.grey[850],
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        textStyle: const TextStyle(color: Colors.white)),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.blueAccent;
        } else {
          return Colors.transparent;
        }
      }),
    ),
  );

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      textTheme: const TextTheme(
          labelSmall: TextStyle(
        color: Colors.black,
      )),
      iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
        iconColor: MaterialStatePropertyAll(Colors.white),
      )),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color.fromARGB(255, 31, 132, 239)),
      appBarTheme: AppBarTheme(
          backgroundColor: transmeetBlue,
          titleTextStyle: const TextStyle(color: Colors.white)),
      scaffoldBackgroundColor: Colors.grey[300],
      popupMenuTheme: const PopupMenuThemeData(),
      brightness: Brightness.light);
}
