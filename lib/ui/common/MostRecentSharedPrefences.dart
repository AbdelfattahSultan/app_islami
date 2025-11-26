import 'package:shared_preferences/shared_preferences.dart';

class MostRecentSharedPreferences {
  static const String _chapters_key = "most_recent";
  late SharedPreferences _sharedPreferences;

  MostRecentSharedPreferences._() {
    // private constructor
  }

  static MostRecentSharedPreferences? _mostRecentProvider;

  static Future<void> init() async {
    if (_mostRecentProvider == null) {
      _mostRecentProvider = MostRecentSharedPreferences._();
      await _mostRecentProvider?._initSharedPreferences();
    }
  }

  static MostRecentSharedPreferences getInstance() {
    if (_mostRecentProvider == null) {
      throw Exception(
        "make sure to call init before using "
        "get Instance",
      );
    }
    return _mostRecentProvider!;
  }

  Future<void> _initSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveChapter(int index) async {
    // reSort chapters
    // [0,2,1]
    var storedList = (_sharedPreferences.getStringList(_chapters_key) ?? []);
    storedList.remove("$index");
    storedList.insert(0, "$index");
    await _sharedPreferences.setStringList(_chapters_key, storedList);
  }

  List<int> getMostRecentChapters() {
    return (_sharedPreferences.getStringList(_chapters_key) ?? [])
        .map((chapterIndexString) => int.parse(chapterIndexString))
        .toList();
  }

  Future<void> checkOnboarding() async {
    await _sharedPreferences.setBool("onboarding", true);
  }

  bool getONboarding() {
    return _sharedPreferences.getBool("onboarding") ?? true;
  }
}
