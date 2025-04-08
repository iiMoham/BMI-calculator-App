import 'package:flutter/material.dart';
import '../components/reuseableCards.dart';
import '../constants.dart';
import 'inputPage.dart';
import '../components/bottomNavBar.dart';

class ResultPage extends StatelessWidget {

  ResultPage(this.Bmi , this.result , this.feedback);

  final String Bmi;
  final String result;
  final String feedback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff090C22),
        title: Center(child: Text("BMI CALCULATOR")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 15, left: 15),
              child: Text("YOUR BMI", style: kTitleStyle),
            ),
          ),
          Expanded(
            flex: 9,
            child: ReuseableCard(
              colour: kInactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(result.toUpperCase(), style: kResultStyle),
                  Text(Bmi, style: kBMIStyle),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      textAlign: TextAlign.center,
                      feedback,
                      style: kSubTitleStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomNavBar(title: "RE-CALCULATE" , onPress: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>InputPage()));
          },),
        ],
      ),
    );
  }
}
