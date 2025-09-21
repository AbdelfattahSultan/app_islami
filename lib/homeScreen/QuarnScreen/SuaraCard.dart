import 'package:flutter/material.dart';
import 'package:islam_app/DataClassChapter/Chapter.dart';
import 'package:islam_app/core/AppColors.dart';
import 'package:islam_app/core/AppImages.dart';

class SuaraCard extends StatelessWidget {
  Chapter chapter;

  SuaraCard({super.key, required this.chapter});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17),
      width: 283,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.gold,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                chapter.englishName,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: AppColors.black),
              ),
              Text(
                chapter.arabicName,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: AppColors.black),
              ),
              Text(
                "${chapter.AyaNum} Verses",
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(color: AppColors.black),
              ),
            ],
          ),
          Expanded(
            child: Column(
              children: [
                Image.asset(
                  AppImages.reading,
                  fit: BoxFit.cover,
                  width: 151,
                  height: 136,
                  color: AppColors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
