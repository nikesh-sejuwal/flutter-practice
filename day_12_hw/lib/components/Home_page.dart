import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Second_page.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({
    super.key,
  });

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  int font = 16;
  int borderW = 4;
  int borderR = 20;
  int boxH = 250;
  int boxW = 250;

  String MyText = 'Hi flutter';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade200,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Finalize your Sticker",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.edit,
                size: 30,
              ),
            ),
            Divider(
              color: Colors.black,
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: boxW.toDouble(),
              height: boxH.toDouble(),
              decoration: BoxDecoration(
                  border: Border.all(
                    width: borderW.toDouble(),
                  ),
                  borderRadius: BorderRadius.circular(borderR.toDouble())),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  MyText,
                  style: TextStyle(
                      fontSize: font.toDouble(), fontWeight: FontWeight.w500),
                ),
              )),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (c) => Second_Page(
                              boxH: boxH,
                              boxW: boxW,
                              font: font,
                              borR: borderR,
                              borW: borderW,
                              InitialText: MyText,
                              handleInitialText: (p0) {
                                MyText = p0;
                                setState(() {});
                              },
                              onFontChange: (p0) {
                                font = p0;
                                setState(() {});
                              },
                              onBorderWChange: (p0) {
                                borderW = p0;
                                setState(() {});
                              },
                              onBorderRChange: (p0) {
                                borderR = p0;
                                setState(() {});
                              },
                              onBoxHChange: (p0) {
                                boxH = p0;
                                setState(() {});
                              },
                              onBoxWChange: (p0) {
                                boxW = p0;
                                setState(() {});
                              },
                            )));
                  },
                  child: Icon(
                    Icons.edit_square,
                    color: Colors.blue,
                    size: 25,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
