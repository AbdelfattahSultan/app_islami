import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islam_app/ChapterDetails/VersesIteam.dart';
import 'package:islam_app/DataClassChapter/Chapter.dart';
import 'package:islam_app/common/AppBackground.dart';

class Chapterdetails extends StatefulWidget {
  const Chapterdetails({super.key});

  @override
  State<Chapterdetails> createState() => _ChapterdetailsState();
}

class _ChapterdetailsState extends State<Chapterdetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    Chapter chapter = ModalRoute.of(context)?.settings.arguments as Chapter;
    loadVerses(chapter.chapterIndex);

    return AppBackground(
      child: Scaffold(
        appBar: AppBar(title: Text(chapter.englishName)),
        body: Column(
          children: [
            Text(
              chapter.arabicName,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Versesiteam(verses: verses[index], index: index + 1);
                },
                itemCount: verses.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loadVerses(int chapterIndex) async {
    String content = await rootBundle.loadString(
      "assets/files/$chapterIndex.txt",
    );

    List<String> lines = content.trim().split("\n");

    setState(() {
      verses = lines;
    });
  }
}
