import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:islami_c16/ui/Chapter.dart';
import 'package:islami_c16/ui/design.dart';
import 'package:islami_c16/ui/routes.dart';

class ChapterRow extends StatelessWidget {
  Chapter chapter;

  ChapterRow({required this.chapter, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.chapterDetails,
          arguments: chapter,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Svg(AppImages.ic_chapter, color: Colors.white),
                    ),
                  ),
                  child: Text("${chapter.chapterIndex}"),
                ),
                SizedBox(width: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(chapter.englishName),
                    SizedBox(height: 8),
                    Text(
                      '${chapter.versesNumber} verses',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ],
            ),
            Text(
              chapter.arabicName,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
