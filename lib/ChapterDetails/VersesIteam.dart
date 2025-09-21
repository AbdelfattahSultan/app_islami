import 'package:flutter/material.dart';

class Versesiteam extends StatelessWidget {
  String verses;
  int index;

  Versesiteam({super.key, required this.index, required this.verses});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      alignment: Alignment.center,
      child: Text(
        "$verses{$index}",
        style: Theme.of(context).textTheme.bodyLarge,
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
