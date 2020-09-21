import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BmiCardContent extends StatelessWidget {
  final IconData icon;
  final String title;

  BmiCardContent({@required this.icon, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          title,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
