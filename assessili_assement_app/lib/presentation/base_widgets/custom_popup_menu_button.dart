import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMenuButton extends StatelessWidget {
  final List<String> options;
  final ValueChanged<String> onSelected;

  const CustomMenuButton(
      {super.key, required this.options, required this.onSelected});
  // Initial filter
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      icon: Icon(Icons.arrow_drop_down,
          size: 40.sp, color: Colors.white), // Filter icon
      onSelected: onSelected,
      itemBuilder: (BuildContext context) {
        // Generate PopupMenuItems from the options list passed
        return options.map((String option) {
          return PopupMenuItem<String>(
            value: option,
            child: Text(option),
          );
        }).toList();
      },
    );
  }
}
