import 'package:flutter/material.dart';

import 'package:islami_c16/ui/design.dart';

class Pageintro extends StatelessWidget {
  final String title;
  final String image;
  final String description;

  const Pageintro({
    super.key,
    required this.title,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.islam, height: 171, width: 291),
          Spacer(flex: 1),
          Center(child: Image.asset(image)),
          Spacer(flex: 2),
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.gold),
          ),
          Spacer(flex: 1),
          Expanded(
            flex: 5,
            child: Text(
              description,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: AppColors.gold),
              textAlign: TextAlign.center,
            ),
          ),
          Spacer(flex: 3),
        ],
      ),
    );
  }
}
