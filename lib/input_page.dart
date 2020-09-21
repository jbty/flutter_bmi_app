import 'package:bmi_calculator/components/bmi_card_content.dart';
import 'package:bmi_calculator/components/bottom_btn.dart';
import 'package:bmi_calculator/components/round_icon_btn.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'components/bmi_card.dart';
import 'constants.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender _selectedGender;
  int _height = 180;
  int _weight = 60;
  int _age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IMC CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BmiCard(
                    onPress: () {
                      setState(() {
                        _selectedGender = Gender.male;
                      });
                    },
                    color: _selectedGender == Gender.male
                        ? kActiveCardColor
                        : kCardColor,
                    cardChild: BmiCardContent(
                      icon: FontAwesomeIcons.mars,
                      title: "HOMME",
                    ),
                  ),
                ),
                Expanded(
                  child: BmiCard(
                    onPress: () {
                      setState(() {
                        _selectedGender = Gender.female;
                      });
                    },
                    color: _selectedGender == Gender.female
                        ? kActiveCardColor
                        : kCardColor,
                    cardChild: BmiCardContent(
                      icon: FontAwesomeIcons.venus,
                      title: "FEMME",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BmiCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "TAILLE",
                          style: kLabelTextStyle,
                        ),
                        Column(
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  _height.toString(),
                                  style: kBigTextStyle,
                                ),
                                Text(
                                  'cm',
                                  style: kLabelTextStyle,
                                ),
                              ],
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 15.0),
                                overlayShape: RoundSliderOverlayShape(
                                    overlayRadius: 30.0),
                                thumbColor: kActionBtnColor,
                                activeTrackColor: kActionBtnColor,
                                overlayColor: kActionBtnOverlayColor,
                              ),
                              child: Slider(
                                value: _height.toDouble(),
                                min: 70.0,
                                max: 220.0,
                                inactiveColor: kActionBtnColorAccent,
                                onChanged: (double newHeight) {
                                  setState(() {
                                    _height = newHeight.round();
                                  });
                                },
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BmiCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'POIDS',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          _weight.toString(),
                          style: kBigTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconBtn(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  if (_weight > 35) _weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconBtn(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  if (_weight < 200) _weight++;
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
                  child: BmiCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          _age.toString(),
                          style: kBigTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconBtn(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  if (_age > 1) _age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconBtn(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  if (_age < 120) _age++;
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
          BottomBtn(
            buttonTitle: "CALCULER",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return ResultPage();
                }),
              );
            },
          )
        ],
      ),
    );
  }
}
