import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Day4(),
  ));
}

class Day4 extends StatelessWidget {
  const Day4({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HELLO DAY 4")),
      body: Center(
          child: Container(
        height: 100,
        width: 300,
        child: Row(
          children: [
            FlutterLogo(),
            Text(
              'Click me',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 226, 147, 10),
            border: Border.all(color: Colors.black, width: 1.5),
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                offset: Offset(10, 10),
                blurRadius: 10,
                spreadRadius: 5,
              )
            ]),
      )),
      // bottomNavigationBar: BottomAppBar(
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       Text(
      //         'Apple',
      //         style: TextStyle(fontSize: 20),
      //       ),
      //       Text('Ball', style: TextStyle(fontSize: 20)),
      //       Text('Cat', style: TextStyle(fontSize: 20)),
      //     ],
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_emergency),
            label: 'Contact',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.room_service_rounded),
            label: 'Service',
          ),
        ],
      ),
    );
  }
}
