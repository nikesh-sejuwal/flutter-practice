import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home_Page(),
  ));
}

class Home_Page extends StatefulWidget {
  const Home_Page({
    super.key,
  });

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  double a_top = 180;
  double a_left = 180;
  @override
  Widget build(BuildContext context) {
    // double sWidth = medi
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Center(child: Text("Day 9 Homework")),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              width: 400,
              height: 400,
              color: Colors.blue,
              child: Stack(
                children: [
                  Positioned(
                    top: a_top,
                    left: a_left,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    if (a_top > 0) {
                      a_top = a_top - 10;
                      setState(() {});
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Reached to the topmost")));
                    }
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.grey,
                    child: Icon(Icons.arrow_upward),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    if (a_left > 0) {
                      a_left = a_left - 10;
                      setState(() {});
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Reached to the leftmost")));
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 18),
                    width: 50,
                    height: 50,
                    color: Colors.grey,
                    child: Icon(Icons.arrow_back),
                  ),
                ),
                InkWell(
                  onTap: () {
                    a_left = 180;
                    a_top = 180;
                    setState(() {});
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.grey,
                    child: Icon(Icons.restart_alt),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (a_left < 350) {
                      a_left = a_left + 10;
                      setState(() {});
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Reached to the rightmost")));
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 18),
                    width: 50,
                    height: 50,
                    color: Colors.grey,
                    child: Icon(Icons.arrow_forward),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    if (a_top < 350) {
                      a_top = a_top + 10;
                      setState(() {});
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Reached to the bottommost")));
                    }
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.grey,
                    child: Icon(Icons.arrow_downward),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
