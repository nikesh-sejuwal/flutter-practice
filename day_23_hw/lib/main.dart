import 'package:day_23_hw/provider/SettingsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/First_Page.dart';

void main() {
  runApp(ChangeNotifierProvider<SettingsProvider>(
    create: (context) => SettingsProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: First_Page(),
    ),
  ));
}
