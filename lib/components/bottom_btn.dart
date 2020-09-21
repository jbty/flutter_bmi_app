import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BottomBtn extends StatelessWidget {
  final Function onTap;
  final String buttonTitle;

  BottomBtn({@required this.onTap, @required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 8.0),
        color: kActionBtnColor,
        width: double.infinity,
        height: 80.0,
        padding: EdgeInsets.only(bottom: 10.0),
        child: Center(
          child: Text(
            buttonTitle,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
