import 'package:flutter/material.dart';

import '../main.dart';

class Dialog_Add extends StatelessWidget {
  final Function(String?) onNewAdd;
  Dialog_Add({super.key, required this.onNewAdd});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add new fruit here..."),
      content: TextField(
        controller: alertController,
        decoration: InputDecoration(hintText: 'Add here.....'),
      ),
      actions: [
        IconButton(
            onPressed: () {
              if (alertController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Add some data to save")));
                return;
              }
              onNewAdd(alertController.text);
              Navigator.of(context).pop();

              // name = alertController.text;

              // Navigator.of(context).pop();
            },
            icon: Icon(Icons.check, color: Colors.green)),
        IconButton(
            onPressed: () {
              onNewAdd(null);
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.close,
              color: Colors.red,
            ))
      ],
    );
  }
}
