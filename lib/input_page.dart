import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icons_reusable.dart';
import 'reuseable_cards.dart';
import 'constants.dart';
import 'calculator_brain.dart';

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColour;
  Color femaleCardColor = inactiveCardColour;
  Gender? selectedGender;
  int height = 180;
  int weight = 50;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    Calculatorbrain cal = Calculatorbrain(height: height, weight: weight);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI  CALCULATOR",
          // style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => {
                    setState(() {
                      selectedGender = Gender.Male;
                    }),
                  },
                  child: ReuseableCard(
                    color: selectedGender == Gender.Male
                        ? activeCardColour
                        : inactiveCardColour,
                    cardChild: CardData(
                      icon: FontAwesomeIcons.mars,
                      label1: "MALE",
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => {
                    setState(() {
                      // updateColor(Gender.Female);
                      selectedGender = Gender.Female;
                    }),
                  },
                  child: ReuseableCard(
                    color: selectedGender == Gender.Female
                        ? activeCardColour
                        : inactiveCardColour,
                    cardChild: CardData(
                      icon: FontAwesomeIcons.venus,
                      label1: "FEMALE",
                    ),
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: ReuseableCard(
              color: activeCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: textStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: textStyleForMid,
                      ),
                      Text(
                        "Cm",
                        style: textStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x30EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) => {
                        setState(
                          () {
                            height = newValue.round();
                          },
                        )
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    color: activeCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: textStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: textStyleForMid,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              update: () => {
                                setState(
                                  () => {
                                    if (weight > 0)
                                      {
                                        weight--,
                                      }
                                    else
                                      {
                                        weight = 0,
                                      }
                                  },
                                )
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: Icons.add,
                              update: () => {
                                setState(
                                  () => {
                                    if (weight < 110)
                                      {
                                        weight++,
                                      }
                                    else
                                      {
                                        weight = weight,
                                      }
                                  },
                                )
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
                    color: activeCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: textStyle,
                        ),
                        Text(
                          age.toString(),
                          style: textStyleForMid,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              update: () => {
                                setState(
                                  () => {
                                    if (age > 0)
                                      {
                                        age--,
                                      }
                                    else
                                      {
                                        age = 0,
                                      }
                                  },
                                )
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: Icons.add,
                              update: () => {
                                setState(
                                  () => {
                                    if (age < 80)
                                      {
                                        age++,
                                      }
                                    else
                                      {
                                        age = age,
                                      }
                                  },
                                )
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
          BottomButton(
            buttonTitle: "CALCULATE",
            ontap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultsPage(
                    bmiResult: cal.calulate_bmi(),
                    bmiText: cal.getResult(),
                    bmiInter: cal.getInterpretation());
              }))
            },
          ),
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({this.ontap, this.buttonTitle});
  final VoidCallback? ontap;
  final String? buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle.toString(),
            style: ktextStyleForMid,
          ),
        ),
        color: bottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 10.0),
        width: double.infinity,
        height: bottomContainerheight,
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.update});
  final IconData? icon;
  final VoidCallback? update;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: update,
      elevation: 6.0,
      // disabledElevation: 6.0,

      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
