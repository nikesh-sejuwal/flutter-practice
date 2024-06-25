import 'package:flutter/material.dart';

class Parameters {
  double borderR;
  double borderW;
  double fontsize;
  double boxW;
  double boxH;
  Color textColor;
  Color boxColor;
  String textToShow;

  Parameters(
      {this.borderR = 5,
      this.borderW = 1,
      this.fontsize = 18,
      this.boxW = 250,
      this.boxH = 250,
      this.textColor = Colors.black,
      this.boxColor = Colors.white,
      this.textToShow = 'Hi Flutter'});
}
