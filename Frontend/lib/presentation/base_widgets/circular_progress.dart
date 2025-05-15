import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionProgressWidget extends StatelessWidget {
  int totalQuestions=0;
  int completedQuestions=0;

  QuestionProgressWidget(
      {super.key,
      required this.completedQuestions,
      required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    double progress = completedQuestions / totalQuestions;

    return Center(
      child: Stack(
        alignment: Alignment.center, // Center the text in the Stack
        children: [
          SizedBox(
            width: 70.w,
            height: 70.h,
            child: CircularProgressIndicator(
              value: progress, // Progress value between 0.0 and 1.0
              strokeWidth: 8.0,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),
          Text(
            '${(progress * 100).toStringAsFixed(1)}%\n$completedQuestions/$totalQuestions',
            textAlign: TextAlign.center, // Display percentage in the center
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
