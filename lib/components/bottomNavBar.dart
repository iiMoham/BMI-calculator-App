import 'package:flutter/material.dart';
import '../constants.dart';
import '../pages/resultPage.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({required this.title, this.onPress});

  final String title;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: 60.0,
        decoration: BoxDecoration(
          color: kRedColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(title, style: TextStyle(color: Colors.white, fontSize: 20.0)),
          ],
        ),
      ),
    );
  }
}
