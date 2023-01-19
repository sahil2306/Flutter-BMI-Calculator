import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

class ReusableCard extends StatelessWidget {

  ReusableCard({@required this.colour,this.cardChild, this.onPress});
  final Color colour;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour,
          borderRadius:BorderRadius.circular(10.0),
        ),
        height: 200.0,
        width: 170.0,
      ),
    );
  }
}

