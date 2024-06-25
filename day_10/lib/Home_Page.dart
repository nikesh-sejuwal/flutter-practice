import 'package:day_10/students_id.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Second_Page.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({
    super.key,
  });

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Center(child: Text('Student lists')),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                  width: 3,
                  color: people[index]['gender'] == 'male'
                      ? Colors.blue
                      : Colors.pink),
            )),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              onTap: () {
                // setState(() {});
                Navigator.of(context).push(CupertinoPageRoute(
                  builder: (c) => Second_page(
                    image_url_: people[index]['image_url'],
                    name_: people[index]['name'],
                    bio_: people[index]['bio'],
                    gender_: people[index]['gender'],
                    age_: people[index]['age'],
                    isGenderChange: (gender) {
                      people[index]['gender'] = gender;
                      setState(() {});
                    },
                    isAgeChange: (age) {
                      people[index]['age'] = age;
                      setState(() {});
                    },
                  ),
                ));
              },
              leading: Image.network(
                people[index]['image_url'],
              ),
              title: Text(people[index]['name']),
              subtitle: Text("${people[index]['age']} Years old"),
            ),
          );
        },
        itemCount: people.length,
      ),
    );
  }
}
