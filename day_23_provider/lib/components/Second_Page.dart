import 'package:flutter/material.dart';

import 'counterBody.dart';
import 'counterChanger.dart';

class First_Page extends StatelessWidget {
  const First_Page({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PROVIDERS'),
        backgroundColor: Colors.red,
      ),
      body: counterBody(),
      // floatingActionButton: counterChanger(),
      bottomNavigationBar: counterChanger(),
    );
  }
}
