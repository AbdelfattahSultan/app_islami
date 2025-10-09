import 'package:flutter/material.dart';
import 'package:islami_c16/ui/design.dart';

class SebhaContent extends StatefulWidget {
  const SebhaContent({super.key});

  @override
  State<SebhaContent> createState() => _SebhaContentState();
}

class _SebhaContentState extends State<SebhaContent> {
  int counter = 0;
  double angle = 0.0;
  int currentAzkarIndex = 0;

  List<String> azkarList = ["سبحان الله", "الحمد لله", "الله أكبر"];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 20),
        Text(
          "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        Expanded(
          child: Stack(
            alignment: AlignmentGeometry.topCenter,
            children: [
              Image.asset(AppImages.sebhaHead, height: size.height * 0.093),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.080),
                child: GestureDetector(
                  onTap: sebhaTap,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Transform.rotate(
                        angle: angle,
                        child: Image.asset(AppImages.sebhaBody),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            azkarList[currentAzkarIndex],
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(
                                  color: Colors.white,
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "$counter",
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(
                                  color: Colors.white,
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void sebhaTap() {
    angle += 15;
    if (counter % 33 == 0) {
      counter = 0;
      currentAzkarIndex = (currentAzkarIndex + 1) % azkarList.length;
    }
    setState(() {
      counter++;
    });
  }
}
