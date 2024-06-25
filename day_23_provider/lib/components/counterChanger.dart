import 'package:day_23_provider/providers/CounterProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class counterChanger extends StatelessWidget {
  const counterChanger({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            onPressed: () {
              CounterProvider prov =
                  Provider.of<CounterProvider>(listen: false, context);
              prov.subCount();
            },
            child: Icon(Icons.remove),
          ),
          TextButton(
            onPressed: () {
              CounterProvider prov =
                  Provider.of<CounterProvider>(listen: false, context);
              prov.addCount();

              ;
            },
            child: Icon(Icons.add),
          ),
          TextButton(
            onPressed: () {
              CounterProvider prov =
                  Provider.of<CounterProvider>(listen: false, context);
              prov.mulCount();

              ;
            },
            child: Text('*10'),
          ),
          TextButton(
            onPressed: () {
              CounterProvider prov =
                  Provider.of<CounterProvider>(listen: false, context);
              prov.DivCount();

              ;
            },
            child: Text('/10'),
          )
        ],
      ),
    );
    // return FloatingActionButton(
    //   onPressed: () {
    //     CounterProvider prov = Provider.of<CounterProvider>(
    //       listen: false,
    //       context,
    //     );
    //     prov.addCount();
    //   },
    //   child: Icon(Icons.add),
    // );
  }
}
