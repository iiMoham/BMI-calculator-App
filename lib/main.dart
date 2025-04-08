// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:bmi_calculator/pages/inputPage.dart';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff090C22),
        scaffoldBackgroundColor: Color(0xff090C22),
      ),
      
      home: InputPage(),
    );
  }
}
