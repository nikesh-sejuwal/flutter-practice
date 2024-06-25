import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// import '../resources/res.dart';

class PopUp_2 extends StatefulWidget {
  String mesg1;
  Function onChange;
  PopUp_2({super.key, required this.mesg1, required this.onChange});

  @override
  State<PopUp_2> createState() => _PopUp_2State();
}

class _PopUp_2State extends State<PopUp_2> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Sure! You want to delete?'),
      content: Container(
        height: 100,
        width: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: IconButton(
                icon: Icon(
                  Icons.done,
                  color: Colors.green,
                  size: 30,
                ),
                onPressed: () async {
                  print("${widget.mesg1}");
                  await http.delete(Uri.parse(
                      'http://10.32.16.43:3000/messages/${widget.mesg1}'));

                  Navigator.of(context).pop();

                  widget.onChange(1);
                },
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.red,
                size: 30,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
