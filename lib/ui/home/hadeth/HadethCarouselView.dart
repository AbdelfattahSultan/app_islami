import 'package:flutter/material.dart';
import 'package:islami_c16/ui/design.dart';
import 'package:islami_c16/ui/home/hadeth/Hadeth.dart';

class HadethCarouselView extends StatelessWidget {
  Hadeth hadeth;

  HadethCarouselView(this.hadeth, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 48, horizontal: 12),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        image: DecorationImage(
          image: AssetImage(AppImages.hadethItemBackground),
        ),
      ),
      child: Column(
        children: [
          Text(
            hadeth.title,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: Colors.black),
          ),
          SizedBox(height: 24),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                hadeth.content,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
