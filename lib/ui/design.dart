import 'package:flutter/material.dart';

class AppColors {
  static const Color gold = Color(0xFFE2BE7F);
  static const Color dark = Color(0xff202020);
}

class AppImages {
  static const String ic_stats = "assets/images/ic_stats.svg";
  static const String ic_quran = "assets/images/ic_quran.svg";
  static const String ic_hadeth = "assets/images/ic_hadeth.svg";
  static const String ic_radio = "assets/images/ic_radio.svg";
  static const String ic_tasbeh = "assets/images/ic_sebha.svg";
  static const String ic_chapter = "assets/images/ic_chapter.svg";

  static const String logo = "assets/images/islami_logo.png";
  static const String imageMostRecent = "assets/images/image_most_recent.png";

  static const String defaultBackground = "assets/images/background.png";
  static const String chapterDetailsBackground =
      "assets/images/chaoter_details_background.png";
  static const String hadethItemBackground = "assets/images/hadeth_item_bg.png";
  static const String islam = "assets/images/Islami.png";
  static const String basmala = "assets/images/basmala.png";
  static const String masged = "assets/images/masged.png";
  static const String doai = "assets/images/doai.png";
  static const String moshaf = "assets/images/moshaf.png";
  static const String sound = "assets/images/sound.png";

  static const String sebhaBody = "assets/images/Sebha_Body.png";
  static const String sebhaHead = "assets/images/sebha_head.png";
}

class AppThemes {
  static var darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: AppColors.gold,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.gold),
    ),
    colorScheme: ColorScheme.dark(primary: AppColors.gold),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),

      bodySmall: TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.gold,
      selectedIconTheme: IconThemeData(color: Colors.white, size: 36),
      unselectedIconTheme: IconThemeData(color: Colors.black, size: 24),
      selectedLabelStyle: TextStyle(color: Colors.white),
      unselectedLabelStyle: TextStyle(color: Colors.black),
    ),
    bottomAppBarTheme: BottomAppBarThemeData(color: AppColors.gold),
    scaffoldBackgroundColor: Colors.transparent,
  );
}
