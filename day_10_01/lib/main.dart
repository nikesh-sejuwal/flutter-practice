// import 'dart:html';

import 'package:day_10_01/post_lists.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';s

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Homepage(),
  ));
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Student Lists",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        )),
        backgroundColor: Colors.yellow.shade600,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
              border: Border.all(
                  width: 2,
                  color: people[index]['gender'] == 'male'
                      ? Colors.blue
                      : Colors.pink),
            ),
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (c) => SecondPage(
                          ChangeName: (newName) {
                            print(newName);
                            people[index]['name'] = newName;
                            setState(() {});
                          },
                          studentDetail: people[index],
                          CheckGender: (gender) {
                            print('$gender');
                            people[index]['gender'] = gender;
                            setState(() {});
                          },
                          CheckAge: (age) {
                            print("$age");
                            people[index]['age'] = age;
                            setState(() {});
                          },
                        )));
              },
              contentPadding: EdgeInsets.zero,
              leading: Image.network(
                people[index]['image_url'],
                fit: BoxFit.cover,
              ),
              title: Text(
                people[index]['name'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              subtitle: Text(people[index]['age'].toString() + " Years old"),
              // subtitle: Text(posts[index]['body']),
            ),
          );
        },
        itemCount: people.length,
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  final Map<String, dynamic> studentDetail;
  final Function(String) CheckGender;
  final Function(int) CheckAge;
  final Function(String) ChangeName;
  // final Function(String) FinalName;
  // final Function()

  SecondPage({
    required this.studentDetail,
    required this.CheckGender,
    required this.CheckAge,
    required this.ChangeName,
    // required this.FinalName,
  });

  // @override
  // imstate

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late bool isMale = widget.studentDetail['gender'] == 'male' ? true : false;
  late int age = widget.studentDetail['age'];
  late String name = widget.studentDetail['name'];

  TextEditingController HamroController = TextEditingController();

  // String changedName = "";
  // var image_;
  @override
  void initState() {
    HamroController.text = widget.studentDetail['name'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // bool widget.gender == 'male' ? true : false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade600,
        title: Center(
            child: Text(
          "Profile of ${widget.studentDetail['name']}",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 150,
                  height: 150,
                  child: ClipOval(
                    child: Image.network(
                      widget.studentDetail['image_url'],
                    ),
                  ),
                  decoration: BoxDecoration(
                    // color: Colors.amber,
                    border: Border.all(width: 3),
                    borderRadius: BorderRadius.circular(100),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    // height: 70,
                    width: 350,
                    // color: Colors.red,
                    child: Text(
                      widget.studentDetail['bio'],
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            ),
            Divider(
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "${age.toString()} Years old",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    children: [
                      Switch(
                          value: isMale,
                          onChanged: (c) {
                            if (isMale == true) {
                              widget.studentDetail['gender'] = 'female';
                            } else {
                              widget.studentDetail['gender'] = 'male';
                            }
                            isMale = c;
                            widget.CheckGender(
                                isMale == true ? 'male' : 'female');
                            setState(() {});
                          }),
                      Text(
                        widget.studentDetail['gender'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (age > 10) {
                      age--;
                    }
                    setState(() {});
                    widget.CheckAge(age);
                  },
                  child: Icon(Icons.remove),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (age < 50) {
                      age++;
                    }

                    setState(() {});
                    widget.CheckAge(age);
                  },
                  child: Icon(Icons.add),
                ),
              ],
            ),
            Divider(color: Colors.black),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 80,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: TextField(
                  controller: HamroController,
                  decoration: InputDecoration(
                      labelText: "Name",
                      hintText: 'Enter Name to Change',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 3))
                      // border:
                      ),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow.shade700,
                ),
                onPressed: () {
                  setState(() {
                    name = HamroController.text;
                  });
                  widget.ChangeName(name);
                },
                child: Icon(Icons.done))
          ],
        ),
      ),
    );
  }
}
