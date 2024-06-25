// import 'package:day_17_todo/functions/function.dart';
import 'package:flutter/material.dart';

class Dialog_com extends StatelessWidget {
  final Function(String?, String?) OnNewAdded;
  const Dialog_com({super.key, required this.OnNewAdded});

  @override
  Widget build(BuildContext context) {
    var titleController = TextEditingController();
    var bodyController = TextEditingController();
    return AlertDialog(
      title: Text('Add New Todo here'),
      content: Container(
        height: 120,
        width: 200,
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(hintText: "Title...."),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: bodyController,
              decoration: InputDecoration(hintText: "Description...."),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {
              if (titleController.text.isEmpty && bodyController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('add both title and body section')));
                return;
              } else
                OnNewAdded(titleController.text, bodyController.text);
              // saveToLocal();
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.check, color: Colors.green)),
        IconButton(
            onPressed: () {
              OnNewAdded(null, null);
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.close, color: Colors.red))
      ],
    );
  }
}
