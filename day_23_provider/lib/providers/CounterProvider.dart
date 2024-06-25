import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int count = 0;

  void addCount() {
    count++;
    notifyListeners();
  }

  void subCount() {
    count--;
    notifyListeners();
  }

  void mulCount() {
    count *= 10;
    notifyListeners();
  }

  void DivCount() {
    count ~/= 10;
    notifyListeners();
  }
}
