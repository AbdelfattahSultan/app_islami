import 'package:flutter/material.dart';
import 'package:islami_c16/ui/Chapter.dart';
import 'package:islami_c16/ui/common/MostRecentSharedPrefences.dart';

class MostRecentProvider extends ChangeNotifier {
  late MostRecentSharedPreferences mostRecentSharedPreferences;
  late List<Chapter> _mostRecentChapters;

  List<Chapter> getMostRecentChapters() {
    return _mostRecentChapters;
  }

  MostRecentProvider() {
    mostRecentSharedPreferences = MostRecentSharedPreferences.getInstance();
    _mostRecentChapters = [];
    refreshMostRecentChapters();
  }

  void saveChapter(Chapter chapter) async {
    await mostRecentSharedPreferences.saveChapter(chapter.chapterIndex);
    refreshMostRecentChapters();
  }

  void refreshMostRecentChapters() {
    _mostRecentChapters = [];
    var savedChaptersIndicesList = mostRecentSharedPreferences
        .getMostRecentChapters();
    for (var chapterIndex in savedChaptersIndicesList) {
      // chapter indices starts from 1-> 114
      var chapter = Chapter.chapters[chapterIndex - 1];
      _mostRecentChapters.add(chapter);
    }
    notifyListeners();
  }

  // Singleton -> single instance per app lifetime (Database connection, sharedPreferences )
  // when to use -> creation of object is expensive // memory Saving

  // Observer -> provider
  // when to use ? when observable data class has data
  // and should send the updates to multiple listeners
}
