import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'bmi_state.dart';

class BmiCubit extends Cubit<BmiState> {
  BmiCubit()
      : super(BmiInitial(gender: 'male', height: 180, weight: 74, age: 19));

  void calculateBmi(double? height, int? weight) {
    final BmiInitial currentState = state as BmiInitial;

    final double heightInMeters = currentState.height! / 100;
    final double bmi =
        (currentState.weight! / (pow(heightInMeters, 2))).floorToDouble();

    emit(BmiCalculated(
        bmi: bmi,
        gender: currentState.gender,
        height: currentState.height,
        weight: currentState.weight,
        age: currentState.age));
  }

  void reCalculateBmi() {
    final BmiCalculated currentState = state as BmiCalculated;

    emit(BmiInitial(
      gender: currentState.gender,
      height: currentState.height,
      weight: currentState.weight,
      age: currentState.age,
    ));
  }

  void pickGender({required String? gender}) {
    final BmiInitial currentState = state as BmiInitial;

    emit(BmiInitial(
      gender: gender,
      height: currentState.height,
      weight: currentState.weight,
      age: currentState.age,
    ));
  }

  void pickHeight({required double? height}) {
    final BmiInitial currentState = state as BmiInitial;

    emit(BmiInitial(
      height: height,
      gender: currentState.gender,
      weight: currentState.weight,
      age: currentState.age,
    ));
  }

  void pickWeight({required String? event}) {
    final BmiInitial currentState = state as BmiInitial;

    if (event == 'increment') {
      emit(BmiInitial(
        height: currentState.height,
        gender: currentState.gender,
        weight: currentState.weight! + 1,
        age: currentState.age,
      ));
    } else if (event == 'decrement') {
      emit(BmiInitial(
        height: currentState.height,
        gender: currentState.gender,
        weight: currentState.weight! - 1,
        age: currentState.age,
      ));
    }
  }

  void pickAge({required String? event}) {
    final BmiInitial currentState = state as BmiInitial;

    if (event == 'increment') {
      emit(BmiInitial(
        height: currentState.height,
        gender: currentState.gender,
        weight: currentState.weight,
        age: currentState.age! + 1,
      ));
    } else if (event == 'decrement') {
      emit(BmiInitial(
        height: currentState.height,
        gender: currentState.gender,
        weight: currentState.weight,
        age: currentState.age! - 1,
      ));
    }
  }
}
