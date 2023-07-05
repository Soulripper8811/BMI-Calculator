import 'dart:math';

class Calculatorbrain {
  Calculatorbrain({this.height, this.weight});
  final int? height;
  final int? weight;
  double? _bmi;
  String calulate_bmi() {
    _bmi = weight! / pow(height! / 100, 2);
    return _bmi!.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi! >= 25.0) {
      return 'Overweight';
    } else if (_bmi! > 18.0) {
      'Normal';
    } else {
      return 'UnderWeight';
    }
    throw "";
  }

  String getInterpretation() {
    if (_bmi! >= 25.0) {
      return "you have a higher body weight.";
    } else if (_bmi! >= 18.5) {
      return "you have normal body Weight.";
    } else {
      return "You have lower";
    }
  }
}
