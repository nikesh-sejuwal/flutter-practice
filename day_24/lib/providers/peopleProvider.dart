import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PeopleProvider with ChangeNotifier {
  List<Map<String, dynamic>> users = [];

  int? selectedId;

  PeopleProvider() {
    FetchUser();
    loadSettings();
  }

  void selectPerson(int? id) {
    selectedId = id;
    notifyListeners();
  }

  Future<void> FetchUser() async {
    try {
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      if (response.statusCode == 200) {
        List<dynamic> decodedInfo = (jsonDecode(response.body));
        users = decodedInfo.map((e) => e as Map<String, dynamic>).toList();
        // print('$users'.toString());

        notifyListeners();
        // print("Fetched users.");
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void setSettings() async {
    var prefs = await SharedPreferences.getInstance();
    if (selectedId != null) {
      prefs.setInt('key', selectedId!);
      notifyListeners();
    }
    // print('MY ID IS settted: $selectedId');
  }

  void loadSettings() async {
    var prefs = await SharedPreferences.getInstance();
    selectedId = prefs.getInt('key');
    // print('MY ID IS getted: $selectedId');
    notifyListeners();
  }
}
