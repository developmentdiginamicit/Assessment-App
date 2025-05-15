import 'package:assessili_assement_app/constants/assets_paths.dart';
import 'package:assessili_assement_app/constants/colors.dart';
import 'package:assessili_assement_app/constants/text_style.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/analaytics_controller.dart';

class TopicWidget extends StatefulWidget {
  const TopicWidget({super.key});
  @override
  State<TopicWidget> createState() => _TopicWidgetState();
}

class _TopicWidgetState extends State<TopicWidget> {
  final List<String> correctAnserCount = [
    "In Correctly Answered Questions",
    "Correctly Answered Questions",
    "Unattempted Questions"
  ];
  List<bool> isExpanded = List.generate(4, (index) => false);

  final analyticsController = Get.put(AnalyticsController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((v) {
      analyticsController.getTopicRecomandation();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Obx(
        () => analyticsController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.sp),
                        image: const DecorationImage(
                            image: AssetImage(AppAssets.popupBackground),
                            fit: BoxFit.fill),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 100,
                              width: double.infinity,
                              child: Center(
                                child: PieChart(
                                  duration: const Duration(milliseconds: 5000),
                                  PieChartData(
                                    sections: [
                                      PieChartSectionData(
                                        value: double.tryParse(
                                                (analyticsController
                                                            .topicModel
                                                            .value
                                                            ?.data
                                                            ?.attemptCount
                                                            ?.correctAttempt ??
                                                        "0")
                                                    .replaceAll('%', '')) ??
                                            0.0,
                                        color: AppColors.primaryColor,
                                        title: analyticsController
                                                .topicModel
                                                .value
                                                ?.data
                                                ?.attemptCount
                                                ?.correctAttempt ??
                                            "0",
                                        titleStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                      PieChartSectionData(
                                        value: double.tryParse(
                                                (analyticsController
                                                            .topicModel
                                                            .value
                                                            ?.data
                                                            ?.attemptCount
                                                            ?.incorrectAttempt ??
                                                        "0")
                                                    .replaceAll('%', '')) ??
                                            0.0,
                                        color: AppColors.disableColor,
                                        title: analyticsController
                                                .topicModel
                                                .value
                                                ?.data
                                                ?.attemptCount
                                                ?.incorrectAttempt ??
                                            "0",
                                        titleStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                      PieChartSectionData(
                                        value: double.tryParse(
                                                (analyticsController
                                                            .topicModel
                                                            .value
                                                            ?.data
                                                            ?.attemptCount
                                                            ?.unattempted ??
                                                        "0")
                                                    .replaceAll('%', '')) ??
                                            0.0,
                                        color: AppColors.navColor,
                                        title: analyticsController
                                                .topicModel
                                                .value
                                                ?.data
                                                ?.attemptCount
                                                ?.unattempted ??
                                            "0",
                                        titleStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                    sectionsSpace: 0,
                                    centerSpaceColor: Colors.red,
                                    centerSpaceRadius: 0,
                                    startDegreeOffset: 20,
                                    borderData: FlBorderData(show: false),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  AppAssets.line,
                                  height: 25.h,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  "In Correct",
                                  style: textFieldStyle,
                                ),
                                const Spacer(),
                                Text(
                                  analyticsController.topicModel.value?.data
                                          ?.attemptCount?.incorrectAttempt ??
                                      "",
                                  style: textFieldStyle,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            const Divider(
                              color: Colors.white,
                              thickness: 0.2,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  AppAssets.line,
                                  height: 25.h,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  "Correct",
                                  style: textFieldStyle,
                                ),
                                const Spacer(),
                                Text(
                                  analyticsController.topicModel.value?.data
                                          ?.attemptCount?.correctAttempt ??
                                      "",
                                  style: textFieldStyle,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            const Divider(
                              color: Colors.white,
                              thickness: 0.2,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  AppAssets.line,
                                  height: 25.h,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  "Unattempted",
                                  style: textFieldStyle,
                                ),
                                const Spacer(),
                                Text(
                                  analyticsController.topicModel.value?.data
                                          ?.attemptCount?.unattempted ??
                                      "",
                                  style: textFieldStyle,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            const Divider(
                              color: Colors.white,
                              thickness: 0.2,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                          ],
                        ),
                      )),
                  ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics:
                        const BouncingScrollPhysics(), // Allow scrolling within ListView
                    itemCount: correctAnserCount.length,
                    itemBuilder: (context, index) {
                      final recommendations = _getRecommendations(index);
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                isExpanded[index] = !isExpanded[index];
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(15.sp),
                              margin: EdgeInsets.only(bottom: 10.h),
                              decoration: const BoxDecoration(
                                // borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: AssetImage(AppAssets.smallContainer),
                                    fit: BoxFit.fitWidth),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    correctAnserCount[index],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.arrow_drop_down,
                                    size: 40,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                          if (isExpanded[index] && recommendations.isNotEmpty)
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20.0),
                              margin: EdgeInsets.symmetric(vertical: 5.h),
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(AppAssets.smallContainer),
                                    fit: BoxFit.fill),
                              ),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: recommendations.length,
                                  itemBuilder: (context, recIndex) {
                                    final recommendation =
                                        recommendations[recIndex];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            recommendation['title'] ?? "",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 10.h),
                                          Text(
                                            recommendation['details'] ?? "",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            )
                        ],
                      );
                    },
                  ),
                ],
              ),
      ),
    );
  }

  /// Helper function to get recommendations for a specific category
  List<Map<String, String>> _getRecommendations(int index) {
    final data = analyticsController.topicModel.value?.data?.recommendations;
    if (index == 0) {
      return data?.correctAttempt?.recommendation
              ?.map((rec) =>
                  {"title": rec.title ?? "", "details": rec.details ?? ""})
              .toList() ??
          [];
    } else if (index == 1) {
      return data?.correctAttempt?.recommendation
              ?.map((rec) =>
                  {"title": rec.title ?? "", "details": rec.details ?? ""})
              .toList() ??
          [];
    } else if (index == 2) {
      return data?.unattempted?.recommendation
              ?.map((rec) =>
                  {"title": rec.title ?? "", "details": rec.details ?? ""})
              .toList() ??
          [];
    }
    return [];
  }
}
