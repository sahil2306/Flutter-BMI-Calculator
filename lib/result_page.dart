import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'input_page.dart';
import 'calculate.dart';

class ResultPage extends StatelessWidget {

  ResultPage({@required this.resInter, @required this.bmires, @required this.resText});

  final String bmires;
  final String resText;
  final String resInter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI Calculator',
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  'Your  Result',
                  style: kTitleTextStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmires,
                    style: kBMITextStyle,
                  ),
                  Text(
                    resInter,
                    textAlign: TextAlign.center,
                    style: kTextStyle,
                  ),

                ],
              ),
            ),
          ),
          BottomButton(onTap: (){
            Navigator.pop(context);
          },
            buttonTitle: 'Re-Calculate',
          ),
        ],
      ),
    );
  }
}
