import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Input page elements Colors
const Color cardColor = Color(0xFF1D1E33);
const Color actionBtnColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BmiCard(
                    color: cardColor,
                    cardChild: Column(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.mars,
                          size: 80.0,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          "HOMME",
                          style: TextStyle(
                            color: Color(0xFF8D8E98),
                            fontSize: 18.0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: BmiCard(
                    color: cardColor,
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
                    color: cardColor,
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
                    color: cardColor,
                  ),
                ),
                Expanded(
                  child: BmiCard(
                    color: cardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: actionBtnColor,
            margin: EdgeInsets.only(top: 15.0),
            width: double.infinity,
            height: 80.0,
          ),
        ],
      ),
    );
  }
}

class BmiCard extends StatelessWidget {
  final Color color;
  final Widget cardChild;

  BmiCard({@required this.color, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: cardChild,
    );
  }
}
