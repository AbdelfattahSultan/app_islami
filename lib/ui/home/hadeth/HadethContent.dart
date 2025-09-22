import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c16/ui/home/hadeth/Hadeth.dart';
import 'package:islami_c16/ui/home/hadeth/HadethCarouselView.dart';

class HadethContent extends StatefulWidget {
  const HadethContent({super.key});

  @override
  State<HadethContent> createState() => _HadethContentState();
}

class _HadethContentState extends State<HadethContent> {
  final CarouselController controller = CarouselController(initialItem: 0);

  static const int carouselMainPageWeight = 8; // 80%
  static const int carouselSecondaryPageSpacing = 1; // 10%
  List<Hadeth> allHadeth = [];

  @override
  Widget build(BuildContext context) {
    if (allHadeth.isEmpty) {
      loadHadethFile();
    }
    return Container(
      child: allHadeth.isEmpty
          ? Center(child: CircularProgressIndicator())
          : CarouselView.weighted(
              controller: controller,
              itemSnapping: true,
              flexWeights: const <int>[
                carouselSecondaryPageSpacing,
                carouselMainPageWeight,
                carouselSecondaryPageSpacing,
              ],
              children: allHadeth.map((hadeth) {
                return HadethCarouselView(hadeth);
              }).toList(),
            ),
    );
  }

  void loadHadethFile() async {
    String fileContent = await rootBundle.loadString(
      "assets/files/ahadeth.txt",
    );
    List<String> hadethContentList = fileContent.trim().split("#");
    for (int i = 0; i < hadethContentList.length; i++) {
      String singleHadethContent = hadethContentList[i].trim();
      //String title = singleHadethContent.split("\n")[0];
      int indexOfFirstLine = singleHadethContent.indexOf("\n");
      String title = singleHadethContent.substring(0, indexOfFirstLine);
      String content = singleHadethContent.substring(indexOfFirstLine + 1);
      Hadeth hadeth = Hadeth(title, content);
      allHadeth.add(hadeth);
    }
    setState(() {});
  }
}
