import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bmi_card.dart';
import 'bmi_card_content.dart';
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
                        ? KActiveCardColor
                        : KCardColor,
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
                        ? KActiveCardColor
                        : KCardColor,
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
                    color: KActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "TAILLE",
                          style: KLabelTextStyle,
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
                                  style: KBigTextStyle,
                                ),
                                Text(
                                  'cm',
                                  style: KLabelTextStyle,
                                ),
                              ],
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 15.0),
                                overlayShape: RoundSliderOverlayShape(
                                    overlayRadius: 30.0),
                                thumbColor: KActionBtnColor,
                                activeTrackColor: KActionBtnColor,
                                overlayColor: KActionBtnOverlayColor,
                              ),
                              child: Slider(
                                value: _height.toDouble(),
                                min: 70.0,
                                max: 220.0,
                                inactiveColor: KActionBtnColorAccent,
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
                    color: KActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'POIDS',
                          style: KLabelTextStyle,
                        ),
                        Text(
                          _weight.toString(),
                          style: KBigTextStyle,
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
                    color: KActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: KLabelTextStyle,
                        ),
                        Text(
                          _age.toString(),
                          style: KBigTextStyle,
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
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return ResultPage();
                }),
              );
            },
            child: Container(
              margin: EdgeInsets.only(top: 8.0),
              color: KActionBtnColor,
              width: double.infinity,
              height: 80.0,
              child: Center(
                child: Text(
                  "CALCULER",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
      fillColor: KAccentCardColor,
    );
  }
}
