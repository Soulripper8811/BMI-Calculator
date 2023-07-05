import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:bmi_calculator/reuseable_cards.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({this.bmiResult, this.bmiText, this.bmiInter});
  final String? bmiResult;
  final String? bmiText;
  final String? bmiInter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Your Result",
                style: kYourResult,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReuseableCard(
              color: activeCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    bmiText.toString(),
                    style: kresultTextStyle,
                  ),
                  Text(
                    bmiResult.toString(),
                    style: kresultTextStyle1,
                  ),
                  Text(
                    bmiInter.toString(),
                    textAlign: TextAlign.center,
                    style: kresultTextStyleBody,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: "RE CALCULATE",
            ontap: () => {Navigator.pop(context)},
          ),
        ],
      ),
    );
  }
}
