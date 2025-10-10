import 'package:flutter/material.dart';
import 'package:islami_c16/ui/design.dart';

class DotIndicator extends StatelessWidget {
  final bool isActive;
  const DotIndicator({super.key, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.symmetric(horizontal: 5),
      duration: Duration(microseconds: 300),
      width: isActive ? 18 : 7,
      height: 7,
      decoration: BoxDecoration(
        color: isActive ? AppColors.gold : Colors.grey,
        borderRadius: BorderRadius.circular(365),
      ),
    );
  }
}
