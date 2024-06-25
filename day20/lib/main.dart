import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: First_Page(),
  ));
}

List<String> message = [
  'Hello World',
  'Hii There',
  'nothing happen',
  'same',
];

class First_Page extends StatefulWidget {
  const First_Page({
    super.key,
  });

  @override
  State<First_Page> createState() => _First_PageState();
}

class _First_PageState extends State<First_Page> {
  var myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Messaging App",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: http.get(Uri.parse('http://10.32.17.12:3000/messages')),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var response = snapshot.data!;

                List<String> decodedMessage = (jsonDecode(response.body)['data']
                        ['messages'] as List<dynamic>)
                    .map((e) => e as String)
                    .toList();
                return Column(
                    children: decodedMessage.reversed
                        .map((e) => Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10),
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                        child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "$e",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )),
                                  ),
                                )
                              ],
                            ))
                        .toList());
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                controller: myController,
                decoration:
                    InputDecoration(hintText: 'Enter the Text here....'),
              ),
            ),
            IconButton(
              onPressed: () async {
                var response = await http.post(
                  Uri.parse('http://10.32.17.12:3000/messages'),
                  headers: {"Content-Type": "application/json"},
                  body: jsonEncode({'message': myController.text}),
                );
                // TextEditingController().clear();
                setState(() {});
                myController.text = '';
              },
              icon: Icon(
                Icons.send,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
