// ignore_for_file: prefer_const_literals_to_create_immutables

// import 'package:chat_app/resources/constants.dart';
import 'dart:convert';

import 'package:day_20_hw/Pages/First_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/widgets.dart';

class CheckSender extends StatefulWidget {
  const CheckSender({super.key});

  @override
  State<CheckSender> createState() => _CheckSenderState();
}

var myController = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey<FormState>();

class _CheckSenderState extends State<CheckSender> {
  bool is_Loading = false;

  void savePersonInfo(int id, String name) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setInt("sender_id", id);
    await prefs.setString("sender_name", name);
    print("$name and $id is saved to local storage");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        title: Text("Group Messaging"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Enter your name to join:",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Form(
                key: formKey,
                child: Container(
                  // height: 50,
                  width: MediaQuery.of(context).size.width * .8,
                  child: TextFormField(
                    controller: myController,
                    validator: (input) {
                      if (input == null) return "Enter something";
                      if (input.isEmpty) return "Enter something";
                      if (!input.contains(" ")) return "Enter full name";
                      return null;
                    },
                    cursorColor: Colors.red,
                    decoration: InputDecoration(
                      focusColor: Colors.red,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red),
                    foregroundColor: MaterialStatePropertyAll(Colors.white)),
                onPressed: !is_Loading
                    ? () async {
                        if (formKey.currentState!.validate()) {
                          try {
                            setState(() {
                              is_Loading = true;
                            });
                            var response = await http.post(
                                Uri.parse(
                                    'https://soch-message.padxu.com/peoples/new'),
                                headers: {"Content-Type": "application/json"},
                                body: jsonEncode({"name": myController.text}));

                            if (response.statusCode == 200) {
                              print('${response.body}');
                              var decoded = jsonDecode(response.body);
                              savePersonInfo(decoded['data']['person']['id'],
                                  decoded['data']['person']['name']);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => First_Page(
                                      sender_id: decoded['data']['person']
                                          ['id'])));
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Errorrr")));
                          } finally {
                            setState(() {
                              is_Loading = false;
                              print('');
                            });
                          }
                        } else {
                          print('Invalid text');
                        }
                      }
                    : null,
                child: !is_Loading
                    ? Text(
                        "Continue",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    : CupertinoActivityIndicator(
                        color: Colors.white,
                        // radius: 30,s
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
