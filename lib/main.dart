import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme:ThemeData(  //to create your own theme
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),  //appBar
        scaffoldBackgroundColor: Color(0xFF0A0E21), //body
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
          )
        ),
      ),
      home: InputPage(),
//
    );
  }
}


