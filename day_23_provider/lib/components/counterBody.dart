import 'package:day_23_provider/providers/CounterProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class counterBody extends StatelessWidget {
  const counterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: Text("You have reached:")),
        Center(
          child:
              Consumer<CounterProvider>(builder: (context, cProvider, child) {
            return Text(
              cProvider.count.toString(),
              style: TextStyle(fontSize: 25),
            );
          }),
        )
      ],
    );
  }
}
