import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class RoundIconBtn extends StatelessWidget {
  final Function onPressed;
  final IconData icon;

  RoundIconBtn({@required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        size: 30.0,
      ),
      onPressed: onPressed,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.9,
      ),
      shape: CircleBorder(),
      fillColor: kAccentCardColor,
    );
  }
}
