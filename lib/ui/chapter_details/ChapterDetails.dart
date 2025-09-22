import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c16/ui/Chapter.dart';
import 'package:islami_c16/ui/chapter_details/verse_item.dart';
import 'package:islami_c16/ui/common/AppScreenWrapper.dart';
import 'package:islami_c16/ui/design.dart';
import 'package:islami_c16/ui/providers/MostRecentProvider.dart';
import 'package:provider/provider.dart';

// untracked -> default status
// tracked -> needs to be tracked (save all changes)
// ignored-> not important (

class ChapterDetails extends StatefulWidget {
  const ChapterDetails({super.key});

  @override
  State<ChapterDetails> createState() => _ChapterDetailsState();
}

class _ChapterDetailsState extends State<ChapterDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var chapter = ModalRoute.of(context)!.settings.arguments as Chapter;
    saveChapterToLastVisited(chapter);
    if (verses.isEmpty) loadVerses(chapter.chapterIndex); // non blocking

    return AppScreenWrapper(
      child: Scaffold(
        appBar: AppBar(title: Text(chapter.englishName)),
        body: AppScreenWrapper(
          backgroundImagePath: AppImages.chapterDetailsBackground,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 32),
                child: Text(
                  chapter.arabicName,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 64),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return VerseItem(verses[index], index + 1);
                    },
                    separatorBuilder: (context, index) => Container(
                      height: 1,
                      margin: EdgeInsets.symmetric(horizontal: 32),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    itemCount: verses.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveChapterToLastVisited(Chapter chapter) {
    MostRecentProvider provider = Provider.of<MostRecentProvider>(
        context, listen: false);
    provider.saveChapter(chapter);
  }

  void loadVerses(int chapterIndex) async {
    // async function can await
    // load file
    String content = await rootBundle.loadString(
      "assets/files/$chapterIndex.txt",
    ); // blocking code
    List<String> lines = content.trim().split("\n");
    print("chapter $chapterIndex loaded from file");
    verses = lines;
    setState(() {});
  }
}
