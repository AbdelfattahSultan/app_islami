import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:islam_app/DataClassChapter/Chapter.dart';
import 'package:islam_app/core/AppImages.dart';
import 'package:islam_app/core/Routes.dart';

class QuarnChapterRow extends StatelessWidget {
  Chapter chapter;

  QuarnChapterRow({super.key, required this.chapter});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      
      onTap: () {
        Navigator.pushNamed(context, Routes.chapterDetails, arguments: chapter);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    image: DecorationImage(image: Svg(AppImages.ic_chapter)),
                  ),
                  child: Text("${chapter.chapterIndex}"),
                ),
                SizedBox(width: 24),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chapter.englishName,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "${chapter.AyaNum} Verses",
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
