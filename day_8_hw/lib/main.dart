import "package:flutter/material.dart";
// import "package:flutter/widgets.dart";

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int incr_size = 30;
  int incr_ball = 0;
  bool isGreen = false;
  void increment_by_10() {
    setState(() {
      incr_size += 10;
    });
  }

  void decrement_by_10() {
    setState(() {
      incr_size -= 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(
            child: Text(
          "StateFul  Widges",
          style: TextStyle(fontSize: 25),
        )),
      ),
      body: Column(
        children: [
          Container(
            width: 450,
            height: 500,
            // color: Colors.blue,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Wrap(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int i = 0; i < incr_ball; i++)
                    Icon(
                      Icons.circle,
                      size: 30 + 0.5 * incr_size,
                      color: isGreen ? Colors.green : Colors.black54,
                    )
                ],
              ),
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      "Circle Size: ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (incr_size > 30) {
                          decrement_by_10();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Cannot reduce further")));
                        }
                      },
                      child: Icon(Icons.remove)),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: Text(
                      incr_size.toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (incr_size < 300) {
                          increment_by_10();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Cannot increase further")));
                        }
                      },
                      child: Icon(Icons.add)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: Text(
                      "No of balls: ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (incr_ball > 0) {
                            incr_ball--;
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Cannot reduce further")));
                          }
                        });
                      },
                      child: Icon(Icons.remove)),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      "$incr_ball",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (incr_ball < 100) {
                            incr_ball++;
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Cannot increase further")));
                          }
                        });
                      },
                      child: Icon(Icons.add)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: Text(
                      "BG Color Green: ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Switch(
                      value: isGreen,
                      onChanged: (v) {
                        setState(() {
                          isGreen = !isGreen;
                        });
                      })
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
