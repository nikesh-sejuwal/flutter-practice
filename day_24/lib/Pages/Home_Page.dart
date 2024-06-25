// import 'dart:convert';

// import 'package:flutter/cupertino.dart';
import 'package:day_24/providers/peopleProvider.dart';
import 'package:day_24/providers/settingsProvider.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter/widgets.dart';
// import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Home_Page extends StatelessWidget {
  Home_Page({super.key});

  @override
  Widget build(BuildContext context) {
    final pProvider = Provider.of<PeopleProvider>(context, listen: false);
    return Center(
      child: Column(
        children: [
          Expanded(
            child: Consumer2<PeopleProvider, SettingsProvider>(
                builder: (context, pProv, sProv, child) {
              return ListView.builder(
                  itemCount: pProv.users.length,
                  itemBuilder: ((context, index) {
                    var user = pProv.users[index];
                    return ListTile(
                      leading: Checkbox(
                        onChanged: (c) {
                          pProvider.selectPerson(
                              c == false ? null : pProvider.users[index]['id']);
                          pProvider.setSettings();
                          if (c == null) {
                            Text("NO STUDENT SELECTED");
                          }
                        },
                        value: ((pProv.selectedId ?? 0) == user['id']),
                      ),
                      title: Text(
                        user['name'],
                        style: TextStyle(
                            fontFamily: sProv.font,
                            fontSize: sProv.fontsize,
                            fontWeight: FontWeight.w500,
                            color: sProv.pColor),
                      ),
                      subtitle: Text(
                        user['address']['city'],
                        style: TextStyle(color: sProv.sColor),
                      ),
                    );
                  }));
            }),
          )
        ],
      ),
    );
  }
}
