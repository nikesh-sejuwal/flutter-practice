import 'package:flutter/material.dart';

class Todos extends StatefulWidget {
  final String Adding;
  final Function(String) OnPass;
  Todos({super.key, required this.Adding, required this.OnPass});

  @override
  State<Todos> createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  late String TodoText = widget.Adding;
  TextEditingController MyTodoController = TextEditingController();
  @override
  void initState() {
    MyTodoController.text = widget.Adding;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              'Add todo here',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          TextField(
            controller: MyTodoController,
            decoration: InputDecoration(
                labelText: widget.Adding,
                hintText: 'Text here....',
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                    borderRadius: BorderRadius.circular(20))),
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  TodoText = MyTodoController.text;
                  widget.OnPass(TodoText);
                  Navigator.of(context).pop();
                });
              },
              icon: Icon(
                Icons.download_done_outlined,
                color: Colors.blue,
                size: 30,
              )),
        ],
      ),
    );
  }
}
