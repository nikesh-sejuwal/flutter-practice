import 'package:flutter/material.dart';

class Second_page extends StatefulWidget {
  final String image_url_;
  final String name_;
  final String bio_;
  final String gender_;
  final int age_;
  final Function(String) isGenderChange;
  final Function(int) isAgeChange;

  Second_page({
    required this.image_url_,
    required this.name_,
    required this.bio_,
    required this.gender_,
    required this.age_,
    required this.isGenderChange,
    required this.isAgeChange,
  });

  @override
  State<Second_page> createState() => _Second_pageState();
}

class _Second_pageState extends State<Second_page> {
  late bool isMale = widget.gender_ == 'male' ? true : false;
  late int age = widget.age_;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Center(child: Text("Hello ${widget.name_}")),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15, bottom: 10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(60)),
                    child: ClipOval(
                      child: Image.network(
                        widget.image_url_,
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.name_,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 350,
                    margin: EdgeInsets.only(top: 10, bottom: 20),
                    child: Text(
                      textAlign: TextAlign.center,
                      widget.bio_,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(width: 2),
                            bottom: BorderSide(width: 2))),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "${age.toString()} Years old",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Switch(
                                  value: isMale,
                                  onChanged: (c) => {
                                        isMale = c,
                                        setState(() {}),
                                        widget.isGenderChange(
                                            c == true ? 'male' : 'female'),
                                      }),
                              Text(
                                (isMale ? "Male" : "female"),
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (age < 50) age++;
                      setState(() {});
                      widget.isAgeChange(age);
                    },
                    child: Text('+'),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (age > 10) age--;
                        setState(() {});
                        widget.isAgeChange(age);
                      },
                      child: Text('-')),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
