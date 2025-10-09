import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:islami_c16/ui/common/AppScreenWrapper.dart';
import 'package:islami_c16/ui/design.dart';
import 'package:islami_c16/ui/home/hadeth/HadethContent.dart';
import 'package:islami_c16/ui/home/prayer/PrayerContent.dart';
import 'package:islami_c16/ui/home/quran/QuranContent.dart';
import 'package:islami_c16/ui/home/radio/RadioContent.dart';
import 'package:islami_c16/ui/home/sebha/SebhaContent.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AppScreenWrapper(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(AppImages.logo, fit: BoxFit.fitHeight),
            ),
            Expanded(
              flex: 8,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                child: tabs[selectedTabIndex],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedTabIndex,
          onTap: (index) {
            setState(() {
              selectedTabIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: AppColors.gold,
              icon: Image(
                image: Svg(AppImages.ic_quran),
                width: 24,
                height: 24,
              ),
              label: "Quran",
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.gold,
              icon: Image(
                image: Svg(AppImages.ic_hadeth),
                width: 24,
                height: 24,
              ),
              label: "Hadeth",
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.gold,
              icon: Image(
                image: Svg(AppImages.ic_tasbeh),
                width: 24,
                height: 24,
              ),
              label: "Mention",
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.gold,
              icon: Image(
                image: Svg(AppImages.ic_radio),
                width: 24,
                height: 24,
              ),
              label: "Radio",
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.gold,
              icon: Image(
                image: Svg(AppImages.ic_stats),
                width: 24,
                height: 24,
              ),
              label: "Prayer",
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> tabs = [
    QuranContent(),
    HadethContent(),
    SebhaContent(),
    RadioContent(),
    Prayercontent(),
  ];
}
