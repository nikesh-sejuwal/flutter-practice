import 'package:day_23_hw/provider/SettingsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<Color> colors = [
  Colors.red,
  Colors.blue,
  Colors.yellow,
  Colors.white,
  Colors.black
];

class Second_Page extends StatefulWidget {
  const Second_Page({super.key});

  @override
  State<Second_Page> createState() => _Second_PageState();
}

var myController = TextEditingController();

class _Second_PageState extends State<Second_Page> {
  @override
  void initState() {
    SettingsProvider sProvider =
        Provider.of<SettingsProvider>(context, listen: false);
    myController.text = sProvider.textToShow.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sProvider = Provider.of<SettingsProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Page'),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
              onPressed: () {
                sProvider.updateText(myController.text);
                // SettingsProvider prov =
                //     Provider.of<SettingsProvider>(listen: false, context);
                // prov.updateText(myController.text);
                // prov.textToShow = myController.text;

                Navigator.of(context).pop();
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Text to Show',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                controller: myController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'Type text here',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('font size:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          SettingsProvider prov = Provider.of<SettingsProvider>(
                              listen: false, context);
                          prov.decrFont();
                        },
                        icon: Icon(Icons.remove)),
                    Consumer<SettingsProvider>(
                        builder: (context, sProvider, child) {
                      return Text(sProvider.fontsize.toString());
                    }),
                    IconButton(
                        onPressed: () {
                          SettingsProvider prov = Provider.of<SettingsProvider>(
                              listen: false, context);
                          prov.incrFont();
                        },
                        icon: Icon(Icons.add))
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Text Color',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    for (int i = 0; i < colors.length; i++)
                      Row(
                        children: [
                          Radio(
                              value: colors[i],
                              groupValue: sProvider.textColor,
                              onChanged: (c) {
                                SettingsProvider prov =
                                    Provider.of<SettingsProvider>(
                                        listen: false, context);
                                prov.updateTColor(c!);
                              }),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: colors[i],
                                  border: Border.all(
                                      width: 1, color: Colors.black)),
                            ),
                          ),
                        ],
                      )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Box Color',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    for (int i = 0; i < colors.length; i++)
                      Row(
                        children: [
                          Radio(
                              value: colors[i],
                              groupValue: sProvider.boxColor,
                              onChanged: (c) {
                                SettingsProvider prov =
                                    Provider.of<SettingsProvider>(
                                        listen: false, context);
                                prov.updateBColor(c!);
                              }),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: colors[i],
                                  border: Border.all(
                                      width: 1, color: Colors.black)),
                            ),
                          ),
                        ],
                      )
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Box Border Width:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          SettingsProvider prov = Provider.of<SettingsProvider>(
                              listen: false, context);
                          prov.decrBorderW();
                        },
                        icon: Icon(Icons.remove)),
                    Consumer<SettingsProvider>(
                        builder: (context, sProvider, child) {
                      return Text(sProvider.borderW.toString());
                    }),
                    IconButton(
                        onPressed: () {
                          SettingsProvider prov = Provider.of<SettingsProvider>(
                              listen: false, context);
                          prov.incrBorderW();
                        },
                        icon: Icon(Icons.add))
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Box Border radius:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          SettingsProvider prov = Provider.of<SettingsProvider>(
                              listen: false, context);
                          prov.decrBorder();
                        },
                        icon: Icon(Icons.remove)),
                    Consumer<SettingsProvider>(
                        builder: (context, sProvider, child) {
                      return Text(sProvider.borderR.toString());
                    }),
                    IconButton(
                        onPressed: () {
                          SettingsProvider prov = Provider.of<SettingsProvider>(
                              listen: false, context);
                          prov.incrBorder();
                        },
                        icon: Icon(Icons.add))
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Box Height:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          SettingsProvider prov = Provider.of<SettingsProvider>(
                              listen: false, context);
                          prov.decrBoxH();
                        },
                        icon: Icon(Icons.remove)),
                    Consumer<SettingsProvider>(
                        builder: (context, sProvider, child) {
                      return Text(sProvider.boxH.toString());
                    }),
                    IconButton(
                        onPressed: () {
                          SettingsProvider prov = Provider.of<SettingsProvider>(
                              listen: false, context);
                          prov.incrBoxH();
                        },
                        icon: Icon(Icons.add))
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Box Width:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          SettingsProvider prov = Provider.of<SettingsProvider>(
                              listen: false, context);
                          prov.decrBoxW();
                        },
                        icon: Icon(Icons.remove)),
                    Consumer<SettingsProvider>(
                        builder: (context, sProvider, child) {
                      return Text(sProvider.boxW.toString());
                    }),
                    IconButton(
                        onPressed: () {
                          SettingsProvider prov = Provider.of<SettingsProvider>(
                              listen: false, context);
                          prov.incrBoxW();
                        },
                        icon: Icon(Icons.add))
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
