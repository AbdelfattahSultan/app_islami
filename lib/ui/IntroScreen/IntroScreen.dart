import 'package:flutter/material.dart';
import 'package:islami_c16/ui/IntroScreen/PageIntro.dart';
import 'package:islami_c16/ui/design.dart';
import 'package:islami_c16/ui/routes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Introscreen extends StatefulWidget {
  static const String routeName = "/introScreen";
  const Introscreen({super.key});

  @override
  State<Introscreen> createState() => _IntroscreenState();
}

class _IntroscreenState extends State<Introscreen> {
  PageController controller = PageController();
  int currentPage = 0;

  void previousPage() {
    controller.previousPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void nextPage() {
    controller.nextPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void goToHome() {
    Navigator.pushReplacementNamed(context,Routes.homeScreenRoutes);
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPage = controller.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            PageView(
              controller: controller,
              children: [
                Pageintro(
                  title: "Welcome To Islami App",
                  image: AppImages.basmala,
                  description: "",
                ),
                Pageintro(
                  title: "Welcome To Islami",
                  image: AppImages.masged,
                  description:
                      "We Are Very Excited To Have You In Our\nCommunity",
                ),
                Pageintro(
                  title: "Reading the Quran",
                  image: AppImages.moshaf,
                  description: "Read, and your Lord is the Most Generous",
                ),
                Pageintro(
                  title: "Bearish",
                  image: AppImages.doai,
                  description: "Praise the name of your Lord, the Most High",
                ),
                Pageintro(
                  title: "Holy Quran Radio",
                  image: AppImages.sound,
                  description:
                      "You can listen to the Holy Quran Radio through the application for free and easily",
                ),
              ],
            ),
            Container(
              alignment: Alignment(0, 0.9 + 0.03), //position of Container
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    currentPage != 0
                        ? InkWell(
                            onTap: previousPage,
                            child: Text(
                              "Back",
                              style: Theme.of(context).textTheme.titleSmall
                                  ?.copyWith(color: AppColors.gold),
                            ),
                          )
                        : SizedBox(width: 50),
                    SmoothPageIndicator(
                      controller: controller,
                      count: 5,
                      effect: WormEffect(
                        activeDotColor: AppColors.gold,
                        dotColor: Colors.grey,
                        dotHeight: 7,
                        dotWidth: 7,
                      ),
                    ),
                    InkWell(
                      onTap:currentPage<4? nextPage:goToHome,
                      child: Text(
                        "Next",
                        style: Theme.of(
                          context,
                        ).textTheme.titleSmall?.copyWith(color: AppColors.gold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
