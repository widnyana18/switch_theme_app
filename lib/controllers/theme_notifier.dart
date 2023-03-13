import 'package:flutter/foundation.dart';

class ThemeNotifier extends ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;

  void switching() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
