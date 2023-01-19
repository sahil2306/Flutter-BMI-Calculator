import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'IconContent.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'result_page.dart';
import 'calculate.dart';
enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedgender;
  int height = 180;
  int weight = 50;
  int age=20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                  child:ReusableCard(
                    //male
                    onPress: (){
                      setState(() {
                        selectedgender=Gender.male;
                      });
                    },
                    colour: selectedgender==Gender.male?kActiveCardColor:kInactiveCardColor,
                    cardChild:  IconContent(icon: FontAwesomeIcons.mars, label: 'MALE',),
                  )
              ),
              Expanded(
                  child:GestureDetector(
                    child: ReusableCard(
                      //female
                      onPress: (){
                        setState(() {
                          selectedgender=Gender.female;
                        });
                      },
                      colour: selectedgender==Gender.female?kActiveCardColor:kInactiveCardColor,
                      cardChild: IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                    ),
                  )
              ),
            ],
           ),
          ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child:ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 7.0),
                        overlayShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max:220,

                        onChanged: (double newValue){
                          setState(() {
                            height = newValue.toInt();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(child:ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            change: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 1.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            change: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                ),
                Expanded(child:ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            change: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 1.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            change: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                ),
            ],
          ),
          ),
          BottomButton(onTap: (){
            calculate calc=calculate(height: height, weight: weight);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(
              bmires: calc.calculateBMI(),
              resText: calc.getResult(),
              resInter: calc.getInterpretation(),
            ) ));
          },
           buttonTitle: 'Calculate',
          ),
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {

  BottomButton({@required this.onTap,this.buttonTitle});

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBottomContainerColor,
      margin: EdgeInsets.only(top: 10.0),
      width: double.infinity,
      height: kBottomContainerHeight,
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Text(
            buttonTitle,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  
  RoundIconButton({@required this.icon, this.change});
  final IconData icon;
  final Function change;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: change,
      child: Icon(icon,size: 15.0,),
      elevation: 6.0,
      disabledElevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 67.0,
        height: 40.0
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}



