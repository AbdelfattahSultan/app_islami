import 'package:flutter/material.dart';
import 'package:islami_c16/ui/chapter_details/ChapterDetails.dart';
import 'package:islami_c16/ui/common/MostRecentSharedPrefences.dart';
import 'package:islami_c16/ui/design.dart';
import 'package:islami_c16/ui/home/HomeScreen.dart';
import 'package:islami_c16/ui/providers/MostRecentProvider.dart';
import 'package:islami_c16/ui/routes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MostRecentSharedPreferences
      .init(); // wait until shared prefences being initialized
  runApp(
      ChangeNotifierProvider(
          create: (context) => MostRecentProvider(),
          child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MostRecentSharedPreferences.getInstance();
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.dark,
      routes: {
        AppRoutes.HomeScreen.route: (context) => HomeScreen(),
        AppRoutes.ChapterDetails.route: (context) => ChapterDetails(),
      },
      initialRoute: AppRoutes.HomeScreen.route,
    );
  }
}
