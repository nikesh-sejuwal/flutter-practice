import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var myController = TextEditingController();
  String myContent = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Future<void> getURI() async {
      setState(() {
        isLoading = true;
      });
      var content = myController.text;
      try {
        var response = await http.get(Uri.parse('https://' + content));
        if (response.statusCode == 200) {
          setState(() {
            isLoading = false;
            myContent = response.body;
          });
        } else {
          setState(() {
            isLoading = false;
            myContent = 'Failed to load source code';
          });
        }
      } catch (e) {
        setState(() {
          isLoading = false;
          myContent = 'Error: $e';
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
          child: Text(
            "My browser",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60,
                    width: 250,
                    child: TextField(
                      controller: myController,
                      decoration: InputDecoration(
                        hintText: 'Add URL here...',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.red),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: 5,
                  // ),
                  InkWell(
                    onTap: () {
                      getURI(); // Call getURI function when tapped
                    },
                    child: Container(
                      height: 60,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          "Get URI",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            if (isLoading)
              CircularProgressIndicator(
                color: Colors.red,
              )
            else
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('$myContent'),
              ),
          ],
        ),
      ),
    );
  }
}
