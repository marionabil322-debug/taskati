import 'package:flutter/material.dart';

class DayItem extends StatelessWidget {
  final bool isSelected;
  final String statusText;
  final void Function()? onTap;

  const DayItem({
    super.key,
    this.isSelected = false,
    required this.statusText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isSelected ? Colors.deepPurple : Colors.grey,
          ),
          child: Center(child: Text(statusText)),
        ),
      ),
    );
  }
}
