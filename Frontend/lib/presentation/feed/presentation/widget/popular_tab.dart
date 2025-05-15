import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';

class PopularTab extends StatelessWidget {
  const PopularTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Popular Content',
        style: TextStyle(fontSize: 24,color: AppColors.whiteColor),
      ),
    );
  }
}