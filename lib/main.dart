import 'package:flutter/material.dart';
import 'package:islami_c16/ui/IntroScreen/Onboarding.dart';

import 'package:islami_c16/ui/chapter_details/ChapterDetails.dart';
import 'package:islami_c16/ui/common/MostRecentSharedPrefences.dart';
import 'package:islami_c16/ui/design.dart';
import 'package:islami_c16/ui/home/HomeScreen.dart';
import 'package:islami_c16/ui/providers/MostRecentProvider.dart';
import 'package:islami_c16/ui/routes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MostRecentSharedPreferences.init(); // wait until shared prefences being initialized
  final hasSeenOnboarding = MostRecentSharedPreferences.getInstance()
      .getONboarding();
  runApp(
    ChangeNotifierProvider(
      create: (context) => MostRecentProvider(),
      child: MyApp(hasSeenOnboarding: hasSeenOnboarding),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool hasSeenOnboarding;
  const MyApp({super.key, required this.hasSeenOnboarding});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MostRecentSharedPreferences.getInstance();
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.dark,
      routes: {
        Routes.homeScreenRoutes: (context) => HomeScreen(),
        Routes.chapterDetails: (context) => ChapterDetails(),
        Routes.introScreen: (context) => Onboarding(),
      },
      initialRoute: hasSeenOnboarding
          ? Routes.homeScreenRoutes
          : Routes.introScreen,
    );
  }
}
