// ignore_for_file: use_key_in_widget_constructors, invalid_required_positional_param, sort_child_properties_last, library_private_types_in_public_api
import 'package:bmi_calculator/calculator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/iconContent.dart';
import '../components/reuseableCards.dart';
import '../constants.dart';
import 'resultPage.dart';
import '../components/bottomNavBar.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = kInactiveCardColor;
  Color femaleColor = kInactiveCardColor;

  double height = 175.0;
  double weight = 70.0;
  int age = 18;

  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff090C22),
        title: Center(
          child: Text('BMI CALCULATOR', style: TextStyle(color: Colors.white)),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour:
                        selectedGender == Gender.male
                            ? maleColor = kActiveCardColor
                            : maleColor = kInactiveCardColor,
                    cardChild: ReuseableChild(
                      text: 'MALE',
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour:
                        selectedGender == Gender.female
                            ? femaleColor = kActiveCardColor
                            : femaleColor = kInactiveCardColor,
                    cardChild: ReuseableChild(
                      text: 'FEMALE',
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("HIGHT", style: kTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(), style: kNumStyle),
                      SizedBox(width: 5),
                      Text("cm", style: kTextStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: kRedColor,
                      inactiveTrackColor: kGrayColor,
                      overlayColor: Color(0x30EA1556),
                      thumbColor: kRedColor,
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                    ),
                    child: Slider(
                      value: height,
                      min: 100,
                      max: 250,

                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round().toDouble();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("WEIGHT", style: kTextStyle),
                        Text(weight.toString(), style: kNumStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                              icon: Icons.add,
                              onPress: () {
                                setState(() {
                                  weight += 1;
                                });
                              },
                            ),
                            SizedBox(width: 20),
                            RoundedIconButton(
                              icon: Icons.remove,
                              onPress: () {
                                setState(() {
                                  weight -= 1;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("AGE", style: kTextStyle),
                        Text(age.toString(), style: kNumStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            RoundedIconButton(
                              icon: Icons.add,
                              onPress: () {
                                setState(() {
                                  age += 1;
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            RoundedIconButton(
                              icon: Icons.remove,
                              onPress: () {
                                setState(() {
                                  age -= 1;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomNavBar(
            title: "CALCULATE YOUR BMI",
            onPress: () {
              setState(() {

                Calculator calc = Calculator(height: height, weight: weight);


                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultPage(
                    calc.getBMI(),
                    calc.getResult(),
                    calc.getFeedBack()
                  )),
                );
              });
            },
          ),
        ],
      ),
    );
  }
}

