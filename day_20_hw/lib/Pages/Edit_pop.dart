import 'dart:convert';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PopUp_1 extends StatefulWidget {
  Map<String, dynamic> mesg2;
  Function onChange;
  PopUp_1({
    super.key,
    required this.mesg2,
    required this.onChange,
  });

  @override
  State<PopUp_1> createState() => _PopUp_1State();
}

var myTextController = TextEditingController();

class _PopUp_1State extends State<PopUp_1> {
  late String mes3 = widget.mesg2['message'];
  late String mes4 = widget.mesg2['id'].toString();

  @override
  void initState() {
    myTextController.text = mes3;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit message'),
      content: Container(
        height: 80,
        width: 80,
        child: Column(
          children: [
            TextField(
              controller: myTextController,
              decoration: InputDecoration(
                hintText: 'Type message...',
              ),
            )
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(
                Icons.done,
                color: Colors.green,
                size: 30,
              ),
              onPressed: () async {
                if (myTextController.text.isEmpty) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('nothing added')));
                } else {
                  widget.mesg2['message'] = myTextController.text.toString();
                  await http.put(
                      Uri.parse(
                          'http://10.32.16.43:3000/messages/${widget.mesg2['id']}'),
                      headers: {"Content-Type": "application/json"},
                      body: jsonEncode({"message": myTextController.text}));

                  Navigator.of(context).pop();
                  widget.onChange();
                }
              },
            ),
            IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.red,
                size: 30,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        )
      ],
    );
  }
}
