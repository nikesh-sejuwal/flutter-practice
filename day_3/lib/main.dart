import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popup Menu Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('Press the more_vert icon below.'),
            SizedBox(height: 20),
            PopupMenuButton<String>(
              onSelected: (String result) {
                // Handle menu item selection
                switch (result) {
                  case 'Delete':
                    print('Delete selected');
                    break;
                  case 'Favorite':
                    print('Favorite selected');
                    break;
                  case 'Share':
                    print('Share selected');
                    break;
                }
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Delete',
                  child: ListTile(
                    leading: Icon(Icons.delete),
                    title: Text('Delete'),
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'Favorite',
                  child: ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text('Favorite'),
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'Share',
                  child: ListTile(
                    leading: Icon(Icons.share),
                    title: Text('Share'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
