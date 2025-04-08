
import 'dart:math';

class Calculator {

  Calculator({required this.height ,required this.weight});


  final double height;
  final double weight;

  late double _bmi;


  String getBMI (){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if (_bmi > 25) {
      return "Overweight";

    }else if(_bmi>18.5){
      return "normal";

    }else{
      return "Underweight";
    }
  }

  String getFeedBack(){
    if (_bmi > 25) {
      return "Your BMI is heigher than the average, try to do more exercise";

    }else if(_bmi>18.5){
      return "Your BMI is normal, good job!";

    }else{
      return "Your BMI is lower than the average, try to eat well!";
    }
  }

}