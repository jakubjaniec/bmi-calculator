import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'dart:math' as Math;

part 'bmi_state.dart';

class BmiCubit extends Cubit<BmiState> {
  BmiCubit()
      : super(BmiInitial(gender: 'male', height: 180, weight: 74, age: 19));

  void calculateBmi({height, weight}) {
    emit(BmiCalculating());

    Timer(Duration(seconds: 2), () {
      if (height.length == 0 || weight.length == 0) {
        emit(BmiError(error: 'Fill all fields'));
        return;
      }
      double heightInMeters = double.parse(height) / 100;
      double bmi = double.parse(weight) / (Math.pow(heightInMeters, 2));
      print(bmi);
      emit(BmiCalculated(bmi: bmi));
    });
  }

  void pickGender(gender) {
    emit(
      BmiInitial(
        gender: gender,
        height: (state as BmiInitial).height,
        weight: (state as BmiInitial).weight,
        age: (state as BmiInitial).age,
      ),
    );
  }

  void pickHeight(height) {
    emit(
      BmiInitial(
        height: height,
        gender: (state as BmiInitial).gender,
        weight: (state as BmiInitial).weight,
        age: (state as BmiInitial).age,
      ),
    );
  }

  void pickWeight(event) {
    if (event == 'increment') {
      emit(
        BmiInitial(
          height: (state as BmiInitial).height,
          gender: (state as BmiInitial).gender,
          weight: (state as BmiInitial).weight! + 1,
          age: (state as BmiInitial).age,
        ),
      );
    } else if (event == 'decrement') {
      emit(
        BmiInitial(
          height: (state as BmiInitial).height,
          gender: (state as BmiInitial).gender,
          weight: (state as BmiInitial).weight! - 1,
          age: (state as BmiInitial).age,
        ),
      );
    }
  }

  void pickAge(event) {
    if (event == 'increment') {
      emit(
        BmiInitial(
          height: (state as BmiInitial).height,
          gender: (state as BmiInitial).gender,
          weight: (state as BmiInitial).weight,
          age: (state as BmiInitial).age! + 1,
        ),
      );
    } else if (event == 'decrement') {
      emit(
        BmiInitial(
          height: (state as BmiInitial).height,
          gender: (state as BmiInitial).gender,
          weight: (state as BmiInitial).weight,
          age: (state as BmiInitial).age! - 1,
        ),
      );
    }
  }
}
