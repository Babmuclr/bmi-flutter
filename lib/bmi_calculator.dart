import 'package:flutter/material.dart';

class BMICalculator{
  BMICalculator({int this.height, int this.weight, int this.age});

  final int height;
  final int weight;
  final int age;

  double _bmi;

  String getBMI(){
    _bmi = weight / (height * height) * 10000;
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi > 25.0) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretation() {
    if (_bmi > 25.0) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

}