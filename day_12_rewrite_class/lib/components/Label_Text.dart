import 'package:flutter/cupertino.dart';

class Label_Text extends StatelessWidget {
  final String text;
  const Label_Text(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}
