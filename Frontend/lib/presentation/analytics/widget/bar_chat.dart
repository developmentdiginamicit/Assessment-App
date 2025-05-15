import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fl_chart/fl_chart.dart';

class TraitScoreCard extends StatelessWidget {
  TraitScoreCard(
      {super.key, required this.averageScore,
      required this.idealScore,
      required this.maximumScore,
      required this.desc,
      required this.title,
      required this.score});
  String title;
  String desc;
  double averageScore;
  double maximumScore;
  double idealScore;
  double score;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 400.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: const LinearGradient(
          colors: [Color(0xFF6A1B9A), Color(0xFF311B92)], // Purple gradient
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              decoration: BoxDecoration(color: color),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.lightbulb,
                        color: Colors.white,
                        size: 30.w,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    desc,
                    style: TextStyle(color: Colors.white70, fontSize: 15.sp),
                  )
                ],
              ),
            ),
            SizedBox(height: 30.h),
            // Trait Score Section
            Row(
              children: [
                Text(
                  "Trait Score",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  "${score ?? 0.0}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            // Bar Chart Section
            Expanded(
              child: BarChart(BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 10,
                minY: 0,
                gridData: const FlGridData(
                    show: true,
                    drawHorizontalLine: true,
                    drawVerticalLine: false),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 2, // Ensures labels appear every 2 units
                      getTitlesWidget: (value, meta) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            value.toInt().toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                ),
                barGroups: [
                  _buildBarGroup(0, idealScore, Colors.purple.shade300),
                  _buildBarGroup(1, averageScore, Colors.purple.shade400),
                  _buildBarGroup(2, score, Colors.purple.shade500),
                ],
                borderData: FlBorderData(show: false),
              )),
            ),

            // Legend Section
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildLegend("Your Score", Colors.purple.shade300),
                SizedBox(width: 10.w),
                _buildLegend("Average", Colors.purple.shade400),
                SizedBox(width: 10.w),
                _buildLegend("Ideal", Colors.purple.shade500),
              ],
            ),
          ],
        ),
      ),
    );
  }

  BarChartGroupData _buildBarGroup(int x, double y, Color color) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y, // The height of the bar
          color: color, // The color of the bar
          width: 20.sp, // Width of the bar
          borderRadius: BorderRadius.circular(2), // Rounded edges for the bar
        ),
      ],
      showingTooltipIndicators: [0], // Tooltip indicator index
    );
  }

  /// Helper method to build legend
  Widget _buildLegend(String text, Color color) {
    return Row(
      children: [
        Container(
          width: 12.w,
          height: 12.w,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 5.w),
        Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 12.sp),
        ),
      ],
    );
  }
}
