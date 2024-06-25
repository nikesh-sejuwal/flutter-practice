import 'package:day_23_provider/providers/CounterProvider.dart';
import 'package:flutter/material.dart';

import 'components/Second_Page.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<CounterProvider>(
    create: (context) => CounterProvider(),
    child: MaterialApp(
      home: First_Page(),
    ),
  ));
}
