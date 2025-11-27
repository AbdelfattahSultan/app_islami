import 'package:flutter/material.dart';
import 'package:islami_c16/ui/design.dart';

// ignore: must_be_immutable
class TapItem extends StatelessWidget {
  String title;
  String id;
  String selected;
  VoidCallback onTap;
  TapItem({
    super.key,
    required this.id,
    required this.onTap,
    required this.title,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = (id == selected);
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(11),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isSelected ? AppColors.gold : AppColors.dark,
          ),
          child: Text(
            title,
            style: TextStyle(color: isSelected ? AppColors.dark : Colors.white),
          ),
        ),
      ),
    );
  }
}
