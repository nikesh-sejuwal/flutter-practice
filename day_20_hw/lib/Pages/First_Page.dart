import 'dart:convert';

import 'package:day_20_hw/Pages/Edit_pop.dart';
import 'package:day_20_hw/Pages/delete_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class First_Page extends StatefulWidget {
  int sender_id;
  First_Page({
    super.key,
    required this.sender_id,
  });

  @override
  State<First_Page> createState() => _First_PageState();
}

var myController = TextEditingController();

class _First_PageState extends State<First_Page> {
  bool sendRequest = false;
  @override
  Widget build(BuildContext context) {
    var borderInfo = OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.pink.shade500, width: 1.5));
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
            ClipOval(
              child: Image.network(
                'https://images.pexels.com/photos/1808387/pexels-photo-1808387.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                height: 45,
                width: 45,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Testing Bot',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Last seen 8:20 PM',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Colors.pink,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Icon(
                  Icons.videocam,
                  color: Colors.white,
                  size: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Icon(
                    Icons.call,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                Icon(
                  Icons.more_vert,
                  color: Colors.white,
                  size: 25,
                ),
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
              child: FutureBuilder(
                  future:
                      http.get(Uri.parse('http://10.32.16.43:3000/messages')),
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      var response = snapshot.data!;
                      var decodedMessage =
                          (jsonDecode(response.body)['data'] as List<dynamic>)
                              .map((e) => e as Map)
                              .toList();
                      return Column(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: decodedMessage
                            .map(
                              (e) => Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    // alignment: Alignment.,
                                    margin: EdgeInsets.only(top: 2.5),
                                    decoration: BoxDecoration(
                                        color: Colors.pink.shade500,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(15),
                                          // bottomRight: Radius.circular(15),
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                        )),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 12),
                                      child: InkWell(
                                        onDoubleTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (builder) => PopUp_1(
                                                    mesg2: e
                                                        as Map<String, dynamic>,
                                                    onChange: () {
                                                      setState(() {});
                                                    },
                                                  ));
                                        },
                                        onLongPress: () {
                                          showDialog(
                                              context: context,
                                              builder: (builder) => PopUp_2(
                                                    mesg1: "${e['id']}",
                                                    onChange: (v) {
                                                      setState(() {});
                                                    },
                                                  ));
                                          // setState(() {});
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "${e['message']}",
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            // Set the maximum number of lines you want to display
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      );
                    } else if (snapshot.hasError) {
                      return Text('ERROR: ${snapshot.error}');
                    } else {
                      return Text('Error has Occured');
                    }
                  })),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: TextField(
                    controller: myController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        label: Text(
                          'Message',
                          style: TextStyle(color: Colors.pink),
                        ),
                        hintText: 'Type a message...',
                        border: borderInfo,
                        enabledBorder: borderInfo,
                        focusedBorder: borderInfo),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    setState(() {
                      sendRequest = true;
                    });
                    var response = await http.post(
                        Uri.parse('http://10.32.16.43:3000/messages'),
                        headers: {"Content-Type": "application/json"},
                        body: jsonEncode({
                          "message": myController.text,
                        }));
                    setState(() {
                      myController.clear();
                    });
                    var decodeResponse = jsonDecode(response.body);
                    if (decodeResponse['status'] != 'success') {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(decodeResponse['data']['message'])));
                    }
                    setState(() {
                      sendRequest = false;
                    });
                  },
                  icon: !sendRequest
                      ? Icon(
                          Icons.send,
                          color: Colors.pink,
                          size: 30,
                        )
                      : CupertinoActivityIndicator(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
