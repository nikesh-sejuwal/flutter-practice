import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  Widget build(BuildContext context) {
    Future<void> checkif() async {
      int?savedId = prefs.
    }
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Column(
              children: [
                Text("Group Chat"),
                SizedBox(
                  height: 20,
                ),
                CupertinoActivityIndicator(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
