import 'package:day_12_rewrite_class/classes/parameters.dart';
import 'package:day_12_rewrite_class/pages/Setting_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Main_page extends StatefulWidget {
  const Main_page({
    super.key,
  });

  @override
  State<Main_page> createState() => _Main_pageState();
}

class _Main_pageState extends State<Main_page> {
  Parameters DetailParameters = Parameters();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.amber.shade400,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Finalize your Sticker',
                style: TextStyle(fontSize: 25),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (c) => Second_Page(
                              onChanged: (p0) {
                                print(p0.textToShow);
                                setState(() {
                                  DetailParameters = p0;
                                });
                              },
                              ConfigParameters: DetailParameters,
                            )));
                  },
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.edit,
                      color: Colors.blueAccent,
                      size: 30,
                    ),
                  ))
            ],
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: DetailParameters.boxH,
                width: DetailParameters.boxW,
                decoration: BoxDecoration(
                    color: DetailParameters.boxColor,
                    border: Border.all(width: DetailParameters.borderW),
                    borderRadius:
                        BorderRadius.circular(DetailParameters.borderR)),
                child: Center(
                    child: Text(
                  DetailParameters.textToShow,
                  style: TextStyle(
                      fontSize: DetailParameters.fontsize,
                      color: DetailParameters.textColor),
                )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
