import 'package:islami_c16/ui/design.dart';

class OnboardingData {
  final String title;
  final String image;
  final String? description;

  const OnboardingData({
    required this.title,
    required this.image,
    this.description,
  });

  static List<OnboardingData> onboardingDataList = [
    OnboardingData(title: "Welcome To Islmi App", image: AppImages.basmala),
    OnboardingData(
      title: "Welcome To Islami",
      image: AppImages.masged,
      description: "We Are Very Excited To Have You In Our Community",
    ),
    OnboardingData(
      title: "Reading the Quran",
      image: AppImages.moshaf,
      description: "Read, and your Lord is the Most Generous",
    ),
    OnboardingData(
      title: "Bearish",
      image: AppImages.doai,
      description: "Praise the name of your Lord, the Most High",
    ),
    OnboardingData(
      title: "Holy Quran Radio",
      image: AppImages.sound,
      description:
          "You can listen to the Holy Quran Radio through the application for free and easily",
    ),
  ];
}
