import 'dart:convert';

import 'package:day_17_todo/pages/First_Page.dart';
import 'package:shared_preferences/shared_preferences.dart';

int giveID() {
  int highest = 0;
  for (Map<String, dynamic> entry in todoList) {
    if (entry['id'] != null && entry['id'] > highest) {
      highest = entry['id'];
    }
  }
  return highest + 1;
}

void saveToLocal() async {
  prefs = await SharedPreferences.getInstance();
  print("this todoliststring: $todoList");
  String encodeList = jsonEncode(todoList);
  print("this isencodelist: $encodeList");
  await prefs.setString('Todo', encodeList);
}
