import 'package:flutter/material.dart';

class Number_Controller extends StatefulWidget {
  final double min;
  final double max;
  final double val;
  final double changeby;
  final Function(double) onChanged;
  const Number_Controller({
    super.key,
    this.min = 0,
    required this.max,
    required this.val,
    this.changeby = 1,
    required this.onChanged,
  });

  @override
  State<Number_Controller> createState() => _Number_ControllerState();
}

class _Number_ControllerState extends State<Number_Controller> {
  late double Value = widget.val;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              if ((Value - widget.changeby) >= widget.min) {
                setState(() {
                  Value -= widget.changeby;
                  widget.onChanged(Value);
                });
              }
            },
            icon: Icon(Icons.remove)),
        Text(
          Value.toString(),
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        IconButton(
            onPressed: () {
              if ((Value + widget.changeby) <= widget.max) {
                setState(() {
                  Value = Value + widget.changeby;
                  widget.onChanged(Value);
                });
              }
            },
            icon: Icon(Icons.add))
      ],
    );
  }
}
