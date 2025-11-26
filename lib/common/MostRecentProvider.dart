import 'package:shared_preferences/shared_preferences.dart';

class MostSharedPreferences {
  static const String mostRecent = "most_recent";
  late SharedPreferences _sharedPreferences;

  MostSharedPreferences._();

  static MostSharedPreferences? _mostRecentProvider;

  static Future<void> init() async {
    if (_mostRecentProvider == null) {
      _mostRecentProvider = MostSharedPreferences._();
      await _mostRecentProvider?.initSharedPreferences();
    }
  }

  static MostSharedPreferences getInstance() {
    return _mostRecentProvider!;
  }

  Future<void> initSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void addChapter(index) {
    var storedList = _sharedPreferences.getStringList(mostRecent) ?? [];
    storedList.remove("$index");
    storedList.insert(0, "$index");
    _sharedPreferences.setStringList(mostRecent, storedList);
  }

  List<int> getMostRecentChapter() {
    return (_sharedPreferences.getStringList(mostRecent) ?? [])
        .map((chapterIndexString) => int.parse(chapterIndexString))
        .toList();
  }
}
