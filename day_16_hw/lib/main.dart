import 'dart:convert';

import 'package:day_16_hw/components/addNew.dart';
import 'package:day_16_hw/functions/functions.dart';
import 'package:day_16_hw/page/Fruit_tile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Map<String, dynamic>> fruits = [];
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Fruit_Page(),
  ));
}

class Fruit_Page extends StatefulWidget {
  const Fruit_Page({
    super.key,
  });
  @override
  State<Fruit_Page> createState() => _Fruit_PageState();
}

late SharedPreferences PREFS;
var alertController = TextEditingController();

@override
class _Fruit_PageState extends State<Fruit_Page> {
  // String name = '';

  @override
  void initState() {
    super.initState();
    getValue();
  }

  void getValue() async {
    PREFS = await SharedPreferences.getInstance();
    String? savedFruits = PREFS.getString("Fruits");
    if (savedFruits != null) {
      var decodeData = jsonDecode(savedFruits);
      for (var item in decodeData) {
        if ((item as Map).containsKey("id")) {
          fruits.add(item as Map<String, dynamic>);
        } else {
          fruits.add({
            "id": giveID(),
            "name": item["name"],
            "quantity": item["quantity"]
          });
        }
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Fruits')),
        backgroundColor: Colors.green,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                onPressed: () {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => Dialog_Add(
                            onNewAdd: (a) {
                              if (a != null && a.isNotEmpty) {
                                fruits.add(
                                    {'name': a, 'quantity': 1, 'id': giveID()});
                              }
                              setState(() {});
                              print("$fruits");
                              saveFruitsToLocalStorage();
                            },
                          ));
                },
                icon: Icon(
                  Icons.add,
                  size: 40,
                )),
          )
        ],
      ),
      body: Column(
        children: [
          for (int i = 0; i < fruits.length; i++)
            Fruit_Tile(fruit_Details: fruits[i])
        ],
      ),
    );
  }
}
