import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:switch_theme_app/controllers/theme_notifier.dart';
import 'package:switch_theme_app/utils/app_theme.dart';
import 'package:switch_theme_app/view/dashboard_view.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeNotifier>(
      create: (context) => ThemeNotifier(),
      child: MainPage(),
    ),
  );
}

class MainPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var isDark = context.select<ThemeNotifier, bool>((value) => value.isDark);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // showSemanticsDebugger: true,
      title: 'Switch Theme App',
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      darkTheme: darkTheme,
      theme: lightTheme,
      home: DashboardView(),
    );
  }
}
