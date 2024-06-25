import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  double borderR = 5;
  double borderW = 1;
  double fontsize = 18;
  double boxW = 250;
  double boxH = 250;
  Color textColor = Colors.black;
  Color boxColor = Colors.white;
  String textToShow = 'Hi Flutter';

  updateTColor(Color newColor) {
    textColor = newColor;
    notifyListeners();
  }

  updateBColor(Color newColor) {
    boxColor = newColor;
    notifyListeners();
  }

// Texttoshow
  void updateText(String newText) {
    textToShow = newText;
    notifyListeners(); // Notify listeners about the change
  }

// BoxWidth
  void incrBoxW() {
    if (boxW < 500) {
      boxW += 10;
    }
    notifyListeners();
  }

  void decrBoxW() {
    if (boxW > 0) {
      boxW -= 10;
    }
    notifyListeners();
  }

// BoxHeight
  void incrBoxH() {
    if (boxH < 500) {
      boxH += 10;
    }
    notifyListeners();
  }

  void decrBoxH() {
    if (boxH > 0) {
      boxH -= 10;
    }
    notifyListeners();
  }

// Border Radius
  void incrBorder() {
    if (borderR < 100) {
      borderR += 5;
    }
    notifyListeners();
  }

  void decrBorder() {
    if (borderR > 0) {
      borderR -= 5;
    }
    notifyListeners();
  }

// Border Width
  void incrBorderW() {
    if (borderW < 15) {
      borderW += 1;
    }
    notifyListeners();
  }

  void decrBorderW() {
    if (borderW > 0) {
      borderW -= 1;
    }
    notifyListeners();
  }

// Font Size
  void incrFont() {
    if (fontsize < 35) {
      fontsize += 1;
    }
    notifyListeners();
  }

  void decrFont() {
    if (fontsize > 0) {
      fontsize -= 1;
    }
    notifyListeners();
  }
}
