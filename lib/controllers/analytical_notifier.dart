import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:switch_theme_app/controllers/analytical_state.dart';

class AnalyticalNotifier extends ChangeNotifier with DiagnosticableTreeMixin {
  AnalyticalState _state = InitialAnalytical();

  AnalyticalNotifier() {
    _analyze();
  }

  AnalyticalState get state => _state;

  Future<void> _analyze() async {
    var range = math.Random().nextInt(100);
    // state.duration = range * 200;
    await Future.delayed(Duration(seconds: 2), () => print('Starting'));

    try {
      await Future.doWhile(() async {
        _state = Analyzing.percentage(_state.percentage! - 1);
        await Future.delayed(
            Duration(milliseconds: 200), () => print('runnning!!'));

        if (_state.percentage! < range) {
          _state as AnalyticalFinished;
          return false;
        } else {
          if (_state.percentage! > 80) {
            _state = Analyzing.status(AnalyticalStatus.excelent);
          } else if (_state.percentage! > 60 && _state.percentage! <= 80) {
            _state = Analyzing.status(AnalyticalStatus.good);
          } else if (_state.percentage! > 40 && _state.percentage! <= 60) {
            _state = Analyzing.status(AnalyticalStatus.normal);
          } else if (_state.percentage! > 20 && _state.percentage! <= 40) {
            _state = Analyzing.status(AnalyticalStatus.bad);
          } else {
            _state = Analyzing.status(AnalyticalStatus.danger);
          }
          notifyListeners();
          return true;
        }
      });
    } on Exception {
      rethrow;
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ObjectFlagProperty('currentData', state));
  }
}
