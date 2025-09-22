import 'package:flutter/material.dart';

class VerseItem extends StatelessWidget {
  String verse;
  int index;

  VerseItem(this.verse, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      alignment: Alignment.center,
      child: Text(
        "$verse {$index}",
        style: Theme.of(context).textTheme.bodyLarge,
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
