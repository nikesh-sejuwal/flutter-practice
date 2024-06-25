import 'package:day_13_to/components/todos.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: home_page()));
}

class home_page extends StatefulWidget {
  const home_page({
    super.key,
  });

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  Map<int, String> MappingList = {};
  TextEditingController Title = TextEditingController();

  void AddInList(String list) {
    int id = MappingList.length + 1;
    setState(() {
      MappingList[id] = list;
    });
  }

  void RemoveList(int id) {
    setState(() {
      MappingList.remove(id);
    });
  }

  // bool isDone = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.format_list_bulleted_add),
            Text("To Do List"),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 500,
            color: Colors.grey,
            child: ListView.builder(
              itemCount: MappingList.length,
              itemBuilder: (context, index) {
                final int id = MappingList.keys.elementAt(index);
                final String task = MappingList.values.elementAt(index);
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.circle, size: 10),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Text(
                                task, // Use the task from MappingList
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              RemoveList(id);
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (c) => Todos(
                        Adding: Title.text,
                        OnPass: (list) {
                          print(list);
                          setState(() {
                            AddInList(list);
                          });
                        },
                      )));
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
