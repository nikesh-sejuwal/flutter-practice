import 'dart:convert';

import 'package:day_17_todo/components/dialog.dart';
import 'package:day_17_todo/pages/Todo_tile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../functions/function.dart';

List<Map<String, dynamic>> todoList = [];

class First_Page extends StatefulWidget {
  First_Page({
    super.key,
  });

  @override
  State<First_Page> createState() => _First_PageState();
}

late SharedPreferences prefs;

class _First_PageState extends State<First_Page> {
  @override
  void initState() {
    super.initState();
    getValue();
  }

  void getValue() async {
    prefs = await SharedPreferences.getInstance();
    String? savedData = prefs.getString('Todo');
    if (savedData != null) {
      var decode = jsonDecode(savedData);
      // print('this is deodeL $decode');
      for (var item in decode) {
        if ((item as Map).containsKey("id")) {
          todoList.add(item as Map<String, dynamic>);
        } else {
          todoList.add(
              {"id": giveID(), "title": item["title"], "body": item["body"]});
        }
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("TodoLists"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => Dialog_com(
                          OnNewAdded: (T, B) {
                            if ((T != null && T.isNotEmpty) &&
                                (B != null && T.isNotEmpty)) {
                              todoList.add({"title": T, "body": B});
                            }
                            setState(() {});
                            print("$todoList");
                            saveToLocal();
                          },
                        ));
              },
              icon: Icon(
                Icons.add_circle_sharp,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          for (int i = 0; i < todoList.length; i++)
            Todo_Tile(todo_details: todoList[i]),
        ],
      ),
    );
  }
}
