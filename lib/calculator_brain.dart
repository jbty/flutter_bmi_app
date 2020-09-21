import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;

  double _bmi;

  CalculatorBrain({this.height, this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi > 40) {
      return 'Obésité morbide ou massive';
    } else if (_bmi > 35 && _bmi <= 40) {
      return 'Obésité sévère';
    } else if (_bmi > 30 && _bmi <= 35) {
      return 'Obésité modérée';
    } else if (_bmi > 25 && _bmi <= 30) {
      return 'Surpoids';
    } else if (_bmi > 18.5 && _bmi <= 25) {
      return 'Corpulence normale';
    } else if (_bmi > 16.5 && _bmi <= 18.5) {
      return 'Maigreur';
    } else {
      return 'Dénutrition';
    }
  }

  String getInterpretation() {
    if (_bmi > 30) {
      return "Un IMC supérieur à 30 suffit au diagnostic de l'obésité.";
    } else if (_bmi > 25 && _bmi <= 30) {
      return 'Un surpoids entraine des risques pour la santé supplémentaire. Un meilleur équilibre alimentaire et une plus grande activité physique sont des solutions.';
    } else if (_bmi > 18.5 && _bmi <= 25) {
      return 'Un IMC dans cette fourchette indique une masse corporelle "dans la norme".';
    } else if (_bmi > 16.5 && _bmi <= 18.5) {
      return 'Maigreur';
    } else {
      return "La dénutrition est caractérisé par une perte de masse grasse et de muscle. Plus la dénutrition est importante, plus l'IMC est faible.";
    }
  }
}
