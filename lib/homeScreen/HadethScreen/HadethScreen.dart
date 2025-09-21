import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islam_app/DataClassChapter/HadethChapter.dart';

import 'package:islam_app/homeScreen/HadethScreen/HadethCarouselView.dart';

class Hadethscreen extends StatefulWidget {
  const Hadethscreen({super.key});

  @override
  State<Hadethscreen> createState() => _HadethscreenState();
}

class _HadethscreenState extends State<Hadethscreen> {
  final CarouselController controller = CarouselController(initialItem: 1);

  List<Hadeth> allHadeth = [];

  @override
  Widget build(BuildContext context) {
    if (allHadeth.isEmpty) {
      getHadeth();
    }
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: allHadeth.isEmpty
                ? Center(child: CircularProgressIndicator())
                : Container(
                    child: CarouselView.weighted(
                      controller: controller,
                      itemSnapping: true,
                      flexWeights: const <int>[1, 7, 1],
                      children: allHadeth.map((hadeth) {
                        return HadethCarouselView(hadeth: hadeth);
                      }).toList(),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Future<void> getHadeth() async {
    String content = await rootBundle.loadString("assets/files/ahadeth.txt");

    List<String> allHadethList = content.trim().split("#");

    for (int i = 0; i < allHadethList.length; i++) {
      String singleHadeth = allHadethList[i].trim();
      int indexOfLastItem = singleHadeth.indexOf("\n");
      String title = singleHadeth.substring(0, indexOfLastItem);
      String content = singleHadeth.substring(indexOfLastItem + 1);

      Hadeth hadeth = Hadeth(title, content);
      allHadeth.add(hadeth);
    }
    setState(() {});
  }
}
