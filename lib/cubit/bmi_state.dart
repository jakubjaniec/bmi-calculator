part of 'bmi_cubit.dart';

@immutable
abstract class BmiState {}

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
  final String? gender;
  final double? height;
  final int? weight;
  final int? age;

  BmiCalculated({this.bmi, this.gender, this.height, this.weight, this.age});
}

class BmiError extends BmiState {
  final String? error;

  BmiError({this.error});
}
