import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: homePage(),
  ));
}

class homePage extends StatefulWidget {
  const homePage({
    super.key,
  });

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int numberOfChange = 0;
  bool switchCase = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          switchCase ? Colors.lightBlue.shade300 : Colors.lightBlue.shade100,
      appBar: AppBar(
        title: Text(
          "Flutter Demo Home Page",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.lightBlueAccent.shade100,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text("Colors switch"),
                Switch(
                    value: switchCase,
                    onChanged: (v) {
                      setState(() {
                        switchCase = !switchCase;
                      });
                    })
              ],
            ),
            Text("You have pushed the button this many times."),
            Text(
              "$numberOfChange",
              style: TextStyle(
                fontSize: 25 + 0.2 * numberOfChange,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            numberOfChange++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
