import 'package:flutter/material.dart';
import 'package:switch_theme_app/controllers/analytical_state.dart';

@immutable
class AnalyticalData {
  final String _msg;
  final List<int> _colors;
  const AnalyticalData._(this._msg, this._colors);

  String get msg => _msg;
  List<int> get colors => _colors;

  static const AnalyticalData excellent = AnalyticalData._(
    'excelent',
    [0xFF3ed5e0, 0xFF3793e8, 0xFF76f0fd, 0xFF6885D4],
  );
  static const AnalyticalData good = AnalyticalData._(
    'good',
    [0xFF3EE0A2, 0xFF37CDE8, 0xFF76FDD0, 0xFF68ACD4],
  );
  static const AnalyticalData normal = AnalyticalData._(
    'normal',
    [0xFFDDE03E, 0xFF6FE837, 0xFFE4FD76, 0xFF87D468],
  );
  static const AnalyticalData bad = AnalyticalData._(
    'bad',
    [0xFFE03E3E, 0xFFE88D37, 0xFFFD7676, 0xFFD49968],
  );
  static const AnalyticalData danger = AnalyticalData._(
    'danger',
    [0xFFE03E8F, 0xFFE83737, 0xFFFD76AA, 0xFFD46868],
  );
  static const AnalyticalData uninitialize = AnalyticalData._(
    'Some items can be optimized',
    [0xFFA8A8A8, 0xFF727272, 0xFFB6B6B6, 0xFF646464],
  );
}
