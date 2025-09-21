import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islam_app/common/AppBackground.dart';
import 'package:islam_app/core/AppColors.dart';
import 'package:islam_app/core/AppImages.dart';
import 'package:islam_app/homeScreen/HadethScreen/HadethScreen.dart';
import 'package:islam_app/homeScreen/QuarnScreen/QuarnScreen.dart';
import 'package:islam_app/homeScreen/RadioScreen/RadioScreen.dart';
import 'package:islam_app/homeScreen/SebhaScreen/SebhaScreen.dart';
import 'package:islam_app/homeScreen/TimeScreen/TimeScreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      image: selectedIndex == 1
          ? AppImages.BackgroundHadeth
          : AppImages.background,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Image.asset(
                  AppImages.islam,
                  width: double.infinity,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Expanded(flex: 8, child: tab[selectedIndex]),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: AppColors.gold,
              label: "Quran",
              icon: SvgPicture.asset(AppImages.ic_quran),
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.gold,
              label: "hadeth",
              icon: SvgPicture.asset(AppImages.ic_hadeth),
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.gold,
              label: "sebha",
              icon: SvgPicture.asset(AppImages.ic_sebha),
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.gold,
              label: "radio",
              icon: SvgPicture.asset(AppImages.ic_radio),
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.gold,
              label: "prayer",
              icon: SvgPicture.asset(AppImages.ic_time),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> tab = [
    QuarnScreen(),
    Hadethscreen(),
    RadioScreen(),
    SebhaScreen(),
    TimeScreen(),
  ];
}
