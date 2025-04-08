// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../constants.dart';

class ReuseableChild extends StatelessWidget {

  ReuseableChild({required this.text ,required this.icon});

  String text;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon , size: 80,),
        SizedBox(height: 15),
        Text(text, style: kTextStyle),
      ],
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  RoundedIconButton({required this.icon, this.onPress});

  final IconData icon;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      child: Icon(icon),
      // elevation: 6,
      constraints: BoxConstraints.tightFor(width: 48.0, height: 48.0),
      shape: CircleBorder(),
      fillColor: kInactiveCardColor,
    );
  }
}
