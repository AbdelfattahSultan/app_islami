import 'package:flutter/material.dart';
import 'package:islam_app/DataClassChapter/HadethChapter.dart';
import 'package:islam_app/core/AppColors.dart';
import 'package:islam_app/core/AppImages.dart';
import 'package:islam_app/core/Routes.dart';

class HadethCarouselView extends StatelessWidget {
  Hadeth hadeth;

  HadethCarouselView({super.key, required this.hadeth});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, Routes.hadethRoute, arguments: hadeth);
        },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 48, horizontal: 12),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          image: DecorationImage(image: AssetImage(AppImages.hadeth_item_bg)),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                hadeth.titel,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: AppColors.black),
              ),
            ),
            Expanded(
              flex: 8,
              child: SingleChildScrollView(
                child: Text(
                  hadeth.content,
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(color: AppColors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
