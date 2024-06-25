import 'package:day_23_hw/pages/Second_Page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/SettingsProvider.dart';

class First_Page extends StatelessWidget {
  const First_Page({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final sProvider = Provider.of<SettingsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Provider new'),
        backgroundColor: Colors.amber,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Second_Page()));
                },
                icon: Icon(
                  Icons.edit,
                  color: Colors.blue,
                  size: 35,
                )),
          )
        ],
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: sProvider.boxH.toDouble(),
              width: sProvider.boxW.toDouble(),
              decoration: BoxDecoration(
                color: sProvider.boxColor,
                border: Border.all(
                    color: Colors.black, width: sProvider.borderW.toDouble()),
                borderRadius:
                    BorderRadius.circular(sProvider.borderR.toDouble()),
              ),
              child: Center(child: Consumer<SettingsProvider>(
                  builder: (context, sProvider, child) {
                return Text(
                  sProvider.textToShow,
                  style: TextStyle(
                      color: sProvider.textColor,
                      fontSize: sProvider.fontsize.toDouble()),
                );
              })),
            ),
          ),
        ],
      ),
    );
  }
}
