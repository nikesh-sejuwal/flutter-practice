// import 'package:flutter/cupertino.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Multiplication Table',
            style: TextStyle(fontSize: 25),
          ),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              children: [
                for (int i = 1; i <= 10; i++)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: numbers_tiles(
                      numberToshow: i,
                    ),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class numbers_tiles extends StatelessWidget {
  int numberToshow;
  numbers_tiles({
    super.key,
    required this.numberToshow,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(CupertinoPageRoute(
            builder: (c) => SecondPage(
                  tableNumber: numberToshow,
                )));
      },
      child: Text(numberToshow.toString()),
    );
  }
}

class SecondPage extends StatelessWidget {
  int tableNumber;
  SecondPage({
    super.key,
    required this.tableNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Multiplication table of $tableNumber',
            style: TextStyle(fontSize: 25),
          ),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          for (int i = 1; i <= 10; i++)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "$tableNumber * $i = ${tableNumber * i}",
                ),
              ),
            ),
        ],
      ),
    );
  }
}
