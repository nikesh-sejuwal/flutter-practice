import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.yellow,
            title: Text("Hello There", style: TextStyle(color: Colors.red)),
            centerTitle: true,
            elevation: 4.5,
            leading: Icon(Icons.account_balance_wallet),
            actions: [
              Icon(Icons.youtube_searched_for_outlined),
              Icon(Icons.add_home)
            ]),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "C",
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  "%",
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  "DEL",
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  "/",
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "7",
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  "8",
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  "9",
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  "*",
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "4",
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  "5",
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  "6",
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  "-",
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "1",
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  "2",
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  "3",
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  "+",
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "00",
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  "0",
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  ".",
                  style: TextStyle(fontSize: 24),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Text(
                    "=",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
          ],
        )),
      )));
}
