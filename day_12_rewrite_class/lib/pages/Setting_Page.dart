// import 'package:day_12_rewrite_class/classes/parameters.dart';
import 'package:day_12_rewrite_class/classes/parameters.dart';
import 'package:day_12_rewrite_class/components/Label_Text.dart';
import 'package:day_12_rewrite_class/components/Number_Controller.dart';
import 'package:flutter/material.dart';

List<Color> colors = [
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.black,
  Colors.white,
];

class Second_Page extends StatefulWidget {
  final Parameters ConfigParameters;
  final Function(Parameters) onChanged;
  Second_Page(
      {super.key, required this.ConfigParameters, required this.onChanged});

  @override
  State<Second_Page> createState() => _Second_PageState();
}

class _Second_PageState extends State<Second_Page> {
  late Parameters myParameters = widget.ConfigParameters;
  TextEditingController myController = TextEditingController();
  @override
  void initState() {
    myController.text = myParameters.textToShow;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.amber.shade400,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Edit the box here',
                  style: TextStyle(fontSize: 25),
                ),
                IconButton(
                    onPressed: () {
                      myParameters.textToShow = myController.text;
                      widget.onChanged(myParameters);
                      Navigator.of(context).pop();
                    },
                    icon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.save,
                        color: Colors.blueAccent,
                        size: 30,
                      ),
                    ))
              ],
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ListView(
            children: [
              Label_Text('Text to show'),
              TextField(
                controller: myController,
                decoration: InputDecoration(
                    labelText: myParameters.textToShow,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 2))),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Label_Text('Text Color'),
                  for (int i = 0; i < colors.length; i++)
                    Row(
                      children: [
                        Radio<Color>(
                            value: colors[i],
                            groupValue: myParameters.textColor,
                            onChanged: (c) {
                              setState(() {
                                myParameters.textColor = c!;
                              });
                            }),
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                              color: colors[i], border: Border.all(width: 1)),
                        )
                      ],
                    ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Label_Text('Box Color'),
                  for (int i = 0; i < colors.length; i++)
                    Row(
                      children: [
                        Radio<Color>(
                            value: colors[i],
                            groupValue: myParameters.boxColor,
                            onChanged: (c) {
                              setState(() {
                                myParameters.boxColor = c!;
                              });
                            }),
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                              color: colors[i], border: Border.all(width: 1)),
                        )
                      ],
                    ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Label_Text('Font Size'),
                  Number_Controller(
                      max: 40,
                      val: myParameters.fontsize,
                      onChanged: (c) {
                        setState(() {
                          myParameters.fontsize = c;
                        });
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Label_Text('Box Border Width'),
                  Number_Controller(
                      max: 20,
                      val: myParameters.borderW,
                      changeby: 2,
                      onChanged: (c) {
                        setState(() {
                          myParameters.borderW = c;
                        });
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Label_Text('Box Border Radius'),
                  Number_Controller(
                      max: 150,
                      val: myParameters.borderR,
                      changeby: 5,
                      onChanged: (c) {
                        setState(() {
                          myParameters.borderR = c;
                        });
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Label_Text('Box Height'),
                  Number_Controller(
                      max: 500,
                      val: myParameters.boxH,
                      changeby: 10,
                      onChanged: (c) {
                        setState(() {
                          myParameters.boxH = c;
                        });
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Label_Text('Box Width'),
                  Number_Controller(
                      max: 500,
                      val: myParameters.boxW,
                      changeby: 10,
                      onChanged: (c) {
                        setState(() {
                          myParameters.boxW = c;
                        });
                      }),
                ],
              ),
              // Text('Text to show',style: TextStyle(font),),
            ],
          ),
        ));
  }
}
