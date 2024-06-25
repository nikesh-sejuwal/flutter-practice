// import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: First_Page()));
}

class First_Page extends StatelessWidget {
  const First_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Todo Lists',
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: FutureBuilder(
        future:
            http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos")),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var response = snapshot.data!;
            List<Map<String, dynamic>> decodedData =
                (jsonDecode(response.body) as List<dynamic>)
                    .map((e) => e as Map<String, dynamic>)
                    .toList();
            return SingleChildScrollView(
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.98,
                  // height: 400,
                  // color: Colors.green,
                  child: Wrap(
                    children: decodedData
                        .map(
                          (e) => Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 7),
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: 200,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: e['completed']
                                        ? Colors.green
                                        : Colors.red,
                                    width: 2),
                                borderRadius: BorderRadius.circular(10),
                                color: e['completed']
                                    ? Colors.lightGreen.shade100
                                    : Colors.red.shade100,
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(1, 1),
                                      blurRadius: 4,
                                      spreadRadius: 4,
                                      color: e['completed']
                                          ? Colors.green.shade100
                                          : Colors.red.shade100)
                                ]),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Item ${e['id']}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Center(
                                    child: Text(
                                      '${e['title']}',
                                      style: TextStyle(
                                          fontSize: 15.5,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff333333)),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Icon(
                                      e['completed']
                                          ? Icons.check
                                          : Icons.close,
                                      color: e['completed']
                                          ? Colors.green
                                          : Colors.red,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text("Error occurs ${snapshot.error}");
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
