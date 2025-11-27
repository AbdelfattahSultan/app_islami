import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_c16/ui/design.dart';

class VoiceCard extends StatelessWidget {
  final String name;
  final VoidCallback onPlay;
  final bool isPlaying;
  final bool isMuted;
  final VoidCallback onMute;
  const VoiceCard({
    super.key,
    required this.name,
    required this.onPlay,
    required this.isPlaying,
    required this.isMuted,
    required this.onMute,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 133,
      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 10),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/radio_back.png"),
        ),
        borderRadius: BorderRadius.circular(12),
        color: AppColors.gold,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(name, style: TextStyle(color: AppColors.dark,fontSize: 16,fontWeight: FontWeight.bold),  ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: onPlay,
                child: SvgPicture.asset(
                  isPlaying
                      ? "assets/images/stop.svg"
                      : "assets/images/play.svg",
                  height: 24,
                ),
              ),
              const SizedBox(width: 20),
              GestureDetector(
                onTap: onMute,
                child: SvgPicture.asset(
                  isMuted
                      ? "assets/images/sound_off.svg"
                      : "assets/images/sound_on.svg",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
