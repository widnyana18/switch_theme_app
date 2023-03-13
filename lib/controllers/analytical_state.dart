import 'package:switch_theme_app/utils/analytical_data.dart';

enum AnalyticalStatus {
  excelent(AnalyticalData.excellent),
  good(AnalyticalData.good),
  normal(AnalyticalData.normal),
  bad(AnalyticalData.bad),
  danger(AnalyticalData.danger),
  uninitialize(AnalyticalData.uninitialize);

  final AnalyticalData value;
  const AnalyticalStatus(this.value);
}

class AnalyticalState {
  final AnalyticalStatus? status;
  final int? percentage;
  final int duration;

  const AnalyticalState({this.percentage, this.status, this.duration = 6000});

  int get time => duration;
  int get percent => percentage!;
  // set duration(int newvalue) => duration = newvalue;
  // AnalyticalStatus get status => status;

  //   const AnalyticalState._({this.percentage, this.status, this.duration = 6000});

  // factory AnalyticalState.initial() {
  //   return AnalyticalState._(
  //       percentage: 100, status: AnalyticalStatus.uninitialize);
  // }
  // factory AnalyticalState.status(AnalyticalStatus newStatus) {
  //   return AnalyticalState._(status: newStatus);
  // }
  // factory AnalyticalState.percentage(int percent) {
  //   return AnalyticalState._(percentage: percent);
  // }
}

class InitialAnalytical extends AnalyticalState {
  const InitialAnalytical()
      : super(percentage: 100, status: AnalyticalStatus.uninitialize);
}

class Analyzing extends AnalyticalState {
  const Analyzing({super.percentage, super.status});

  factory Analyzing.status(AnalyticalStatus newStatus) {
    return Analyzing(status: newStatus);
  }
  factory Analyzing.percentage(int percent) {
    return Analyzing(percentage: percent);
  }
}

class AnalyticalFinished extends AnalyticalState {
  const AnalyticalFinished();
}
