import 'package:flutter/material.dart';
import 'package:islam_app/ChapterDetails/ChapterDetails.dart';
import 'package:islam_app/IntroScreen/IntroScreen.dart';
import 'package:islam_app/core/DarkTheme.dart';
import 'package:islam_app/core/Routes.dart';
import 'package:islam_app/homeScreen/HadethScreen/HadethDetails.dart';
import 'package:islam_app/homeScreen/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: DarkTheme.darkTheme,
      themeMode: ThemeMode.dark,
      routes: {
        Routes.homeScreenRoutes: (context) => Homescreen(),
        Routes.chapterDetails: (context) => Chapterdetails(),
        Routes.hadethRoute:(context) => Hadethdetails(),
        Routes.introScreen:(context) => Introscreen(),
      },
      initialRoute: Routes.introScreen,
    );
  }
}
