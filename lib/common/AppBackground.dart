import 'package:flutter/material.dart';
import 'package:islam_app/core/AppImages.dart';

class AppBackground extends StatelessWidget {
  Widget child;
  String image;

  AppBackground({
    required this.child,
    super.key,
    this.image = AppImages.background,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image)),
      ),
      child: child,
    );
  }
}
