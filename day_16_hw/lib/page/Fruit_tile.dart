import 'package:day_16_hw/functions/functions.dart';
import 'package:day_16_hw/main.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class Fruit_Tile extends StatefulWidget {
  final Map<String, dynamic> fruit_Details;
  Fruit_Tile({
    super.key,
    required this.fruit_Details,
  });

  @override
  State<Fruit_Tile> createState() => _Fruit_TileState();
}

class _Fruit_TileState extends State<Fruit_Tile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              Map<String, dynamic>? obtainedFruit =
                  giveFruitByID(widget.fruit_Details['id']);
              if (obtainedFruit != null) {
                obtainedFruit['quantity'] = obtainedFruit["quantity"] + 1;
                saveFruitsToLocalStorage();
              }
            });
          },
          child: Center(
            child: Container(
              margin: EdgeInsets.only(top: 15),
              width: MediaQuery.of(context).size.width * 0.95,
              decoration: BoxDecoration(
                color: Colors.green.shade300,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    offset: Offset(3, 3),
                    spreadRadius: 5,
                    color: Colors.grey,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${widget.fruit_Details['name']}'),
                    // Text('${widget.Fruit_Details['id']}'),
                    Row(
                      children: [
                        Text('${widget.fruit_Details['quantity']}'),
                        IconButton(
                            onPressed: () async {
                              fruits = removeById(widget.fruit_Details['id']);
                              await saveFruitsToLocalStorage();
                              setState(() {});
                            },
                            icon: Icon(
                              Icons.delete_forever,
                              color: Colors.red,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
