// import 'dart:js';

import 'package:day_24/providers/peopleProvider.dart';
import 'package:day_24/providers/settingsProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Profile_Page extends StatelessWidget {
  Profile_Page({super.key});
  @override
  Widget build(BuildContext context) {
    // final sProvider = Provider.of<SettingsProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
      child: Center(
        child: Consumer2<PeopleProvider, SettingsProvider>(
            builder: (context, pProv, sProv, child) {
          var myTextStyle = TextStyle(
              fontFamily: sProv.font,
              fontSize: sProv.fontsize,
              fontWeight: FontWeight.w500,
              color: sProv.sColor);
          var user = pProv.users[pProv.selectedId! - 1];
          return pProv.selectedId == null
              ? SizedBox()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Image.network(
                          'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover),
                    ),
                    SizedBox(height: 40),
                    Text(
                      ("Name: ${user['name'].toString()}"),
                      style: myTextStyle,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Address: ${user['address']['city'].toString()}",
                      style: myTextStyle,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Work at: ${user['company']['name'].toString()}",
                      style: myTextStyle,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Phone no.: ${user['phone'].toString()}",
                      style: myTextStyle,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Email: ${user['email'].toString()}",
                      style: myTextStyle,
                    ),
                  ],
                );
        }),
      ),
    );
  }
}
