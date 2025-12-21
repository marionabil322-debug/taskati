import 'package:flutter/material.dart';

class DayItem extends StatelessWidget {
  final String dayName;
  final String dayNumber;
  final String dayShort;
  final bool isSelected;
  final VoidCallback onTap;

  const DayItem({
    super.key,
    required this.dayName,
    required this.dayNumber,
    required this.dayShort,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? Colors.deepPurple : Colors.grey.shade300,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(dayName, style: TextStyle(color: Colors.white, fontSize: 12)),
            SizedBox(height: 4),
            Text(
              dayNumber,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 4),
            Text(dayShort, style: TextStyle(fontSize: 12, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
