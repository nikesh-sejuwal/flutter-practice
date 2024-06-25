import 'dart:convert';

import 'package:day_16_hw/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

int giveID() {
  int highest = 0;
  for (Map<String, dynamic> entry in fruits) {
    if (entry['id'] != null && entry['id'] > highest) {
      highest = entry['id'];
    }
  }
  return highest + 1;
}

Map<String, dynamic>? giveFruitByID(int id) {
  for (Map<String, dynamic> entry in fruits) {
    if (entry['id'] == id) return entry;
  }
  return null;
}

// void removeById(int id) {
//   fruits.removeWhere((entry) => entry['id'] == id);
// }
List<Map<String, dynamic>> removeById(int id) {
  List<Map<String, dynamic>> newFruits = [];
  for (Map<String, dynamic> entry in fruits) {
    if (entry['id'] == id) continue;
    newFruits.add(entry);
  }
  fruits = newFruits;
  return newFruits;
}
// void removeMe(int id) {
//   fruits.remove(id);
// }

Future<void> saveFruitsToLocalStorage() async {
  SharedPreferences PREFS = await SharedPreferences.getInstance();
  String jsonEncodedFruits = jsonEncode(fruits);
  await PREFS.setString('Fruits', jsonEncodedFruits);
}
