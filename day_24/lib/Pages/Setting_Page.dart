// import 'dart:js';

// import 'dart:js';

import 'package:day_24/providers/settingsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

List<String> myFonts = ['font1', 'font2', 'font3', 'font4', 'font5'];

class Setting_Page extends StatefulWidget {
  const Setting_Page({super.key});

  @override
  State<Setting_Page> createState() => _Setting_PageState();
}

class _Setting_PageState extends State<Setting_Page> {
  List<Color> myColor = [Colors.red, Colors.green, Colors.black];
  // String? selectedItem = myFonts[0];
  @override
  Widget build(BuildContext context) {
    final sProvider = Provider.of<SettingsProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Font Size',
                style: TextStyle(
                    color: sProvider.sColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: sProvider.font),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        // SettingsProvider sProvider =
                        //     Provider.of<SettingsProvider>(context,
                        //         listen: false);
                        sProvider.decrFont();
                        sProvider.saveSettings();
                      },
                      icon: Icon(Icons.remove)),
                  Consumer<SettingsProvider>(builder: (context, sProv, child) {
                    return Text(sProv.fontsize.toString(),
                        style: TextStyle(
                            color: sProvider.sColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: sProvider.font));
                  }),
                  IconButton(
                      onPressed: () {
                        // SettingsProvider sProvider =
                        //     Provider.of<SettingsProvider>(context,
                        //         listen: false);
                        sProvider.incrFont();
                        sProvider.saveSettings();
                      },
                      icon: Icon(Icons.add))
                ],
              )
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Primary Color',
                style: TextStyle(
                    color: sProvider.sColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: sProvider.font),
              ),
              Row(
                children: [
                  for (int i = 0; i < myColor.length; i++)
                    Column(
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              color: myColor[i], border: Border.all(width: 1)),
                        ),
                        Consumer<SettingsProvider>(
                            builder: (context, sProv, child) {
                          return Radio(
                              value: myColor[i],
                              groupValue: sProv.pColor,
                              onChanged: (c) {
                                sProvider.changePColor(c!);
                                sProvider.saveSettings();
                              });
                        })
                      ],
                    ),
                ],
              )
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Secondary Color',
                style: TextStyle(
                    color: sProvider.sColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: sProvider.font),
              ),
              Row(
                children: [
                  for (int i = 0; i < myColor.length; i++)
                    Column(
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              color: myColor[i], border: Border.all(width: 1)),
                        ),
                        Consumer<SettingsProvider>(
                            builder: (context, sProv, child) {
                          return Radio(
                              value: myColor[i],
                              groupValue: sProv.sColor,
                              onChanged: (c) {
                                sProvider.changeSColor(c!);
                                sProvider.saveSettings();
                              });
                        })
                      ],
                    ),
                ],
              )
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Font-Family',
                style: TextStyle(
                    color: sProvider.sColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: sProvider.font),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Consumer<SettingsProvider>(
                          builder: (context, sProv, child) {
                        return DropdownButton<String>(
                          value: sProv.font,
                          hint: Text('Select an item'),
                          items: myFonts
                              .map((e) =>
                                  DropdownMenuItem(child: Text(e), value: e))
                              .toList(),
                          onChanged: (newItem) {
                            sProvider.changeFont(newItem!);
                            sProvider.saveSettings();
                          },
                        );
                      }),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
