import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islam_app/DataClassChapter/Chapter.dart';
import 'package:islam_app/common/MostRecentProvider.dart';
import 'package:islam_app/core/AppColors.dart';
import 'package:islam_app/core/AppImages.dart';
import 'package:islam_app/homeScreen/QuarnScreen/QuarnChapterRow.dart';
import 'package:islam_app/homeScreen/QuarnScreen/SuaraCard.dart';

class QuarnScreen extends StatefulWidget {
  const QuarnScreen({super.key});

  @override
  State<QuarnScreen> createState() => _QuarnScreenState();
}

class _QuarnScreenState extends State<QuarnScreen> {

  List<Chapter> visitedChapters =[];

  @override
  void initState() {
    var savedChapters = MostRecentProvider.getInstance().getMostRecentChapter();

    savedChapters.forEach((chapterIndex) {
      var chapter = Chapter.chapters[chapterIndex];
      visitedChapters.add(chapter);
    });
    super.initState();
  }

  final List<Chapter> chaptersList = Chapter.qetQuranChapter();

  List<Chapter> filterChapters = [];

  _QuarnScreenState() {
    filterChapters = chaptersList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            onChanged: (text) {
              filterSuaraList(text.toLowerCase());
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.gold, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.gold, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.gold, width: 1),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.gold, width: 1),
              ),
              hint: Text(
                "Sura Name",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  AppImages.ic_quran,
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                  height: 2,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
              child: Text(
                "Most Recently ",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return SuaraCard(chapter: visitedChapters[index]);
                },
                separatorBuilder: (context, index) => SizedBox(width: 10),
                itemCount: visitedChapters.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) =>
                QuarnChapterRow(chapter: filterChapters[index]),
            itemCount: filterChapters.length,
            separatorBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 64),
                height: 1,
                color: AppColors.white,
              );
            },
          ),
        ),
      ],
    );
  }

  void filterSuaraList(String text) {
    List<Chapter> filterList = [];
    for (int i = 0; i < chaptersList.length; i++) {
      if (chaptersList[i].arabicName.toLowerCase().contains(text) ||
          chaptersList[i].englishName.toLowerCase().contains(text)) {
        filterList.add(chaptersList[i]);
      }
    }
    setState(() {
      filterChapters = filterList;
    });
  }
}
