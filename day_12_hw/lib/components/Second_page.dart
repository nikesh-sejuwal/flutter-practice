import 'package:flutter/material.dart';

class Second_Page extends StatefulWidget {
  final Function(String) handleInitialText;
  final Function(int) onFontChange;
  final Function(int) onBorderWChange;
  final Function(int) onBorderRChange;
  final Function(int) onBoxWChange;
  final Function(int) onBoxHChange;
  final String InitialText;
  final int font;
  final int borR;
  final int borW;
  final int boxH;
  final int boxW;
  const Second_Page({
    super.key,
    required this.onBorderWChange,
    required this.onBorderRChange,
    required this.onFontChange,
    required this.onBoxHChange,
    required this.onBoxWChange,
    required this.InitialText,
    required this.font,
    required this.borW,
    required this.borR,
    required this.boxH,
    required this.boxW,
    required this.handleInitialText,
  });

  @override
  State<Second_Page> createState() => _Second_PageState();
}

class _Second_PageState extends State<Second_Page> {
  late int fontChange = widget.font;
  late int borderW = widget.borW;
  late int borderR = widget.borR;
  // late int boxH = widget.boxH;
  late String content = widget.InitialText;
  late int boxH = widget.boxH;
  late int boxW = widget.boxW;

  TextEditingController myController = TextEditingController();

  @override
  void initState() {
    myController.text = widget.InitialText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade200,
        title: Text(
          'Edit Settings',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Text to show',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: TextField(
                controller: myController,
                decoration: InputDecoration(
                    labelText: "Text here",
                    hintText: "Edit text",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black, width: 3))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Font Size',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (fontChange > 10) {
                              fontChange--;
                            }
                            widget.onFontChange(fontChange);
                          });
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          // color: Colors.black,
                          child: Icon(
                            Icons.remove,
                            weight: 20,
                          ),
                        ),
                      ),
                      Text(
                        fontChange.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      InkWell(
                        onTap: () {
                          if (fontChange < 50) {
                            fontChange++;
                          }
                          setState(() {});
                          widget.onFontChange(fontChange);
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          // color: Colors.black,
                          child: Icon(
                            Icons.add,
                            weight: 20,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  height: 30,
                  child: Text('Text Color',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  height: 30,
                  child: Text('Box color',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Box Border Width',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          if (borderW > 0) {
                            borderW--;
                          }
                          setState(() {});
                          widget.onBorderWChange(borderW);
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          // color: Colors.black,
                          child: Icon(
                            Icons.remove,
                            weight: 20,
                          ),
                        ),
                      ),
                      Text(
                        borderW.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      InkWell(
                        onTap: () {
                          if (borderW < 15) {
                            borderW++;
                          }
                          setState(() {});
                          widget.onBorderWChange(borderW);
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          // color: Colors.black,
                          child: Icon(
                            Icons.add,
                            weight: 20,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Box Border Radius',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          if (borderR > 0) {
                            borderR--;
                          }
                          setState(() {});
                          widget.onBorderRChange(borderR);
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          // color: Colors.black,
                          child: Icon(
                            Icons.remove,
                            weight: 20,
                          ),
                        ),
                      ),
                      Text(
                        borderR.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      InkWell(
                        onTap: () {
                          if (borderW < 150) {
                            borderR++;
                          }
                          setState(() {});
                          widget.onBorderRChange(borderR);
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          // color: Colors.black,
                          child: Icon(
                            Icons.add,
                            weight: 20,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Box Height',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (boxH > 20) {
                              boxH -= 10;
                            }
                          });
                          widget.onBoxHChange(boxH);
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          // color: Colors.black,
                          child: Icon(
                            Icons.remove,
                            weight: 20,
                          ),
                        ),
                      ),
                      Text(
                        boxH.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (boxH < 500) {
                              boxH += 10;
                            }
                          });
                          widget.onBoxHChange(boxH);
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          // color: Colors.black,
                          child: Icon(
                            Icons.add,
                            weight: 20,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Box Width',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (boxW > 10) {
                              boxW -= 10;
                            }
                          });
                          widget.onBoxWChange(boxW);
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          // color: Colors.black,
                          child: Icon(
                            Icons.remove,
                            weight: 20,
                          ),
                        ),
                      ),
                      Text(
                        boxW.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (boxW < 500) {
                              boxW += 10;
                            }
                          });
                          widget.onBoxWChange(boxW);
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          // color: Colors.black,
                          child: Icon(
                            Icons.add,
                            weight: 20,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  content = myController.text;
                  widget.handleInitialText(content);
                });
                Navigator.of(context).pop();
              },
              child: Container(
                width: 100,
                height: 50,
                child: Text(
                  "save",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.lightBlue),
              ),
            )
          ],
        ),
      ),
    );
  }
}
