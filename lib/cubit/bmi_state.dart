part of 'bmi_cubit.dart';

@immutable
abstract class BmiState {}

// ignore: must_be_immutable
class BmiInitial extends BmiState {
  final String? gender;
  final double? height;
  final int? weight;
  final int? age;

  BmiInitial({this.gender, this.height, this.weight, this.age});
}

class BmiCalculating extends BmiState {}

class BmiCalculated extends BmiState {
  final double? bmi;

  BmiCalculated({this.bmi});
}

class BmiError extends BmiState {
  final String? error;

  BmiError({this.error});
}
