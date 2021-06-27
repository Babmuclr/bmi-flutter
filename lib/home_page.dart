import 'package:bmi_calculator/twobuttons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'dart:math';

import 'constants.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'twobuttons.dart';
import 'result_page.dart';
import 'bmi_calculator.dart';

enum Gender{
  male,
  female,
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      theme: ThemeData.dark(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender choiceGender = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ReusableCard(
                    color: choiceGender == Gender.male
                        ? kInactiveCardColor
                        : kActiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                    onPress: (){
                      setState(() {
                        choiceGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: choiceGender == Gender.female
                        ? kInactiveCardColor
                        : kActiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'MALE',
                    ),
                    onPress: (){
                      setState(() {
                        choiceGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kInactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                      RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                      RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
              onPress: () => {},
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        twobutton(
                          color: kBottomContainerColor,
                          icon1: FontAwesomeIcons.minus,
                          icon2: FontAwesomeIcons.plus,
                          onPress1: (){
                            setState(() {
                              weight = max(weight-1,0);
                            });
                          },
                          onPress2: (){
                            setState(() {
                              weight = min(weight+1,200);
                            });
                          },
                        ),
                      ],
                    ),
                    onPress: () => {},
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        twobutton(
                          color: kBottomContainerColor,
                          icon1: FontAwesomeIcons.minus,
                          icon2: FontAwesomeIcons.plus,
                          onPress1: (){
                            setState(() {
                              age = max(age-1,0);
                            });
                          },
                          onPress2: (){
                            setState(() {
                              age = min(age+1,120);
                            });
                          },
                        ),
                      ],
                    ),
                    onPress: () => {},
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              BMICalculator bmiCalculator = BMICalculator(
                height: height,
                weight: weight,
                age: age,
              );
              Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: bmiCalculator.getBMI(),
                    interpretation: bmiCalculator.getInterpretation(),
                    resultText: bmiCalculator.getResult(),
                  ),
                ),
              );
            },
            child: Container(
              color: kBottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              height: 80.0,
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                    fontSize: 40.0,
                  ),
                ),
              ),
            ),
          ),
        ],),
    );
  }
}
