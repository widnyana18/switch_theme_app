import 'package:flutter/material.dart';

final _theme = ThemeData();
TextTheme get txtTheme {
  return _theme.textTheme.copyWith(
    labelMedium: _theme.textTheme.labelMedium?.copyWith(
      fontFamily: 'Poppins',
      fontSize: 10,
      fontWeight: FontWeight.w300,
    ),
    bodySmall: _theme.textTheme.bodySmall?.copyWith(
      fontFamily: 'Poppins',
      fontSize: 11,
      fontWeight: FontWeight.normal,
    ),
    titleLarge: _theme.textTheme.titleMedium?.copyWith(
      fontFamily: 'Poppins',
      fontSize: 20,
      fontWeight: FontWeight.normal,
    ),
    titleMedium: _theme.textTheme.titleMedium?.copyWith(
      fontFamily: 'Poppins',
      fontSize: 15,
      fontWeight: FontWeight.normal,
    ),
    titleSmall: _theme.textTheme.titleSmall?.copyWith(
      fontFamily: 'Poppins',
      fontSize: 12,
      fontWeight: FontWeight.normal,
    ),
    displayMedium: _theme.textTheme.displayMedium?.copyWith(
      fontFamily: 'Poppins',
      fontSize: 60,
      fontWeight: FontWeight.w500,
    ),
  );
}

ThemeData get lightTheme {
  return _theme.copyWith(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF0080e3),
      background: Color(0XFFf7f7f7),
      primaryContainer: Color(0xFFAAAAAA),
      secondaryContainer: Color(0xFFDFDFDF),
    ),
    primaryColor: const Color(0xFF0080e3),
    useMaterial3: true,
    textTheme: txtTheme,
    canvasColor: const Color(0xFFF8FEFF),
    backgroundColor: const Color(0XFFf7f7f7),
    scaffoldBackgroundColor: const Color(0XFFf7f7f7),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: Size(0, 25),
        backgroundColor: Colors.white,
        side: BorderSide(color: Color(0xFFD3D3D3), width: .4),
        shape: StadiumBorder(),
        textStyle: txtTheme.titleSmall?.copyWith(color: Color(0xFF0080e3)),
      ),
    ),
    cardTheme: CardTheme(
      color: const Color(0xFFF8FEFF),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: Color(0xFFD3D3D3), width: .4),
      ),
    ),
    listTileTheme: ListTileThemeData(
      minVerticalPadding: 0,
      minLeadingWidth: 40,
      iconColor: Color(0xFF5F5F5F),
      dense: true,
    ),
  );
}

ThemeData get darkTheme {
  return _theme.copyWith(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      background: Color(0XFF191919),
      primaryContainer: Color(0xFF414141),
      secondaryContainer: Color(0xFF333333),
    ),
    canvasColor: const Color(0xFF2B2B2B),
    backgroundColor: const Color(0XFF191919),
    scaffoldBackgroundColor: const Color(0XFF191919),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: Color(0xFF2B2B2B),
        side: BorderSide(color: Color(0xFF646464), width: .5),
        shape: StadiumBorder(),
        minimumSize: Size(0, 25),
        textStyle: txtTheme.titleSmall?.copyWith(color: Color(0xFF0080e3)),
      ),
    ),
    cardTheme: CardTheme(
      color: const Color(0xFF2B2B2B),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: Color(0xFF646464), width: .5),
      ),
    ),
    listTileTheme: ListTileThemeData(
      minVerticalPadding: 0,
      minLeadingWidth: 40,
      iconColor: Color(0xFFBDBDBD),
      dense: true,
    ),
  );
}
