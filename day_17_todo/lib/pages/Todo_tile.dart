import 'package:flutter/material.dart';

class Todo_Tile extends StatefulWidget {
  final Map<String, dynamic> todo_details;
  const Todo_Tile({super.key, required this.todo_details});

  @override
  State<Todo_Tile> createState() => _Todo_TileState();
}

class _Todo_TileState extends State<Todo_Tile> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 15),
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.amber.shade100,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.todo_details['title']}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text("${widget.todo_details['body']}"),
            ],
          ),
        ),
      ),
    );
  }
}
