// import 'dart:js';

import 'package:day_24/Pages/Home_Page.dart';
import 'package:day_24/Pages/Profile_Page.dart';
import 'package:day_24/Pages/Setting_Page.dart';
import 'package:day_24/providers/peopleProvider.dart';
import 'package:day_24/providers/settingsProvider.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/widgets.dart';

void main() {
  // Provider.debugCheckInvalidValueType = null;
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<PeopleProvider>(
          create: (context) => PeopleProvider()),
      ChangeNotifierProvider<SettingsProvider>(
          create: (context) => SettingsProvider()),
    ],
    child: Consumer<SettingsProvider>(builder: (context, sProv, child) {
      return MaterialApp(
        theme: ThemeData(
          fontFamily: sProv.font,
        ),
        debugShowCheckedModeBanner: false,
        home: First_Page(),
      );
    }),
  ));
}

class First_Page extends StatefulWidget {
  const First_Page({
    super.key,
  });

  @override
  State<First_Page> createState() => _First_PageState();
}

class _First_PageState extends State<First_Page> {
  int current_state = 0;

  final List<Widget> pages = [Home_Page(), Profile_Page(), Setting_Page()];

  void ChangeOnTap(int index) {
    setState(() {
      current_state = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(builder: (context, sProv, child) {
      return Scaffold(
          appBar: AppBar(
            title: Center(
                child: Text(
              'Students',
              style: TextStyle(color: Colors.white),
            )),
            backgroundColor: sProv.pColor,
          ),
          body: pages[current_state],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: current_state,
            onTap: ChangeOnTap,
            fixedColor: Colors.red,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.manage_accounts,
                  ),
                  label: 'Profile'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Setting')
            ],
          ));
    });
  }
}
