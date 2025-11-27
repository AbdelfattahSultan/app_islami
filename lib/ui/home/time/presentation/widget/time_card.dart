import 'package:flutter/material.dart';

class TimeCard extends StatelessWidget {
  final String name;
  final String time;
  final bool isSelected;

  const TimeCard({
    super.key,
    required this.name,
    required this.time,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final parts = time.split(":");
    final hour = parts[0];
    final minute = parts[1];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("assets/images/time_card.png"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 6),
                ),
              ]
            : [],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name.toUpperCase(),
            style: TextStyle(
              color: Colors.white.withOpacity(isSelected ? 1 : 0.7),
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "$hour:$minute",
            style: TextStyle(
              color: Colors.white,
              fontSize: isSelected ? 26 : 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            isSelected ? "" : "",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
