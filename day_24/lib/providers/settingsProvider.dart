// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  double fontsize = 19;
  Color pColor = Colors.black;
  Color sColor = Colors.black;
  String font = 'font1';

  SettingsProvider() {
    loadSettings();
  }

  void changeFont(String f) {
    font = f;
    notifyListeners();
  }

  // Incr Fontsize
  void incrFont() {
    if (fontsize < 35) {
      fontsize++;
      print(fontsize);
    }
    notifyListeners();
  }

  void decrFont() {
    if (fontsize > 0) {
      fontsize--;
    }
    notifyListeners();
  }

  void changePColor(Color newColor) {
    pColor = newColor;
    notifyListeners();
  }

  void changeSColor(Color newColor) {
    sColor = newColor;
    notifyListeners();
  }

  void saveSettings() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setDouble('fontSize', fontsize);
      prefs.setInt('primaryColor', pColor.value);
      prefs.setInt('secondaryColor', sColor.value);
      prefs.setString('fontFamily', font);
      // print("Settings saved successfully $fontsize as fontsize");
      notifyListeners();
    } catch (e) {
      print("Error saving settings: $e");
    }
  }

  void loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    fontsize = prefs.getDouble('fontSize') ?? 19;
    pColor = Color(prefs.getInt('primaryColor') ?? Colors.black.value);
    sColor = Color(prefs.getInt('secondaryColor') ?? Colors.black.value);
    font = prefs.getString('fontFamily') ?? font;
    // print(
    //     "Loaded settings: fontsize=$fontsize, pColor=$pColor, sColor=$sColor, fontfamily = $font");
    notifyListeners(); // Notify listeners after loading settings
  }
}
