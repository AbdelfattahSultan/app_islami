import 'package:flutter/material.dart';
import 'package:islami_c16/ui/IntroScreen/OnboardingData.dart';
import 'package:islami_c16/ui/common/DotIndecator.dart';
import 'package:islami_c16/ui/common/MostRecentSharedPrefences.dart';
import 'package:islami_c16/ui/design.dart';
import 'package:islami_c16/ui/routes.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.dark,
        body: Column(
          children: [
            const Row(),
            Image.asset(
              AppImages.islam,
              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            Expanded(
              child: PageView.builder(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemCount: OnboardingData.onboardingDataList.length,
                itemBuilder: (BuildContext context, int index) {
                  var page = OnboardingData.onboardingDataList[index];
                  return Column(
                    children: [
                      Image.asset(page.image),
                      SizedBox(height: 20),

                      Text(
                        page.title,
                        style: Theme.of(
                          context,
                        ).textTheme.titleLarge?.copyWith(color: AppColors.gold),
                      ),
                      SizedBox(height: 20),
                      Text(
                        page.description ?? "",
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(color: AppColors.gold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                currentIndex != 0
                    ? TextButton(
                        onPressed: () {
                          controller.previousPage(
                            duration: Duration(microseconds: 200),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Text("back"),
                      )
                    : SizedBox(width: 60),
                Row(
                  children: List.generate(
                    OnboardingData.onboardingDataList.length,
                    (index) => DotIndicator(
                      isActive: index == currentIndex ? true : false,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (currentIndex <
                        OnboardingData.onboardingDataList.length - 1) {
                      controller.nextPage(
                        duration: Duration(microseconds: 300),
                        curve: Curves.easeIn,
                      );
                    } else {
                      Navigator.pushReplacementNamed(
                        context,
                        Routes.homeScreenRoutes,
                      );
                      MostRecentSharedPreferences.getInstance()
                          .checkOnboarding();
                    }
                  },
                  child: Text(
                    currentIndex < OnboardingData.onboardingDataList.length - 1
                        ? "next"
                        : "done",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
