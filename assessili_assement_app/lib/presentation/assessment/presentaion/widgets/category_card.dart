import 'package:assessili_assement_app/constants/assets_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controller/assessment_controller.dart';

class CategoryCardWidget extends StatelessWidget {
  CategoryCardWidget(
      {super.key,
      this.subject,
      required this.index,
      this.title,
      this.leadingIcon,
      this.tralingICon,
      this.fontSize = 17,
      this.leadinColor,
      this.tralingColor});
  int index;
  String? subject;
  String? title;
  String? leadingIcon;
  IconData? tralingICon;
  double fontSize;
  Color? leadinColor;
  Color? tralingColor;
  final testController = Get.put(AssessmentController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          index != testController.selectedIndexForReview.value
              ? InkWell(
                  onTap: () {
                    testController.updateSelectedIndexForReview(index ?? -1);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(15.sp),
                    margin: EdgeInsets.symmetric(vertical: 7.sp),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppAssets.smallContainer),
                            fit: BoxFit.fill)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          leadingIcon != null
                              ? Image.asset(
                                  leadingIcon!,
                                  height: 30.h,
                                  width: 30.w,
                                  color: leadinColor ?? Colors.white,
                                )
                              : Text(
                                  "Section ${index + 1}: ",
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                          leadingIcon != null
                              ? SizedBox(width: 10.w)
                              : const SizedBox.shrink(),
                          Expanded(
                            child: Text(
                              subject ?? "",
                              style: TextStyle(
                                  fontSize: fontSize,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                          leadingIcon != null
                              ? SizedBox(width: 20.w)
                              : const SizedBox.shrink(),
                          Icon(
                            tralingICon ?? Icons.arrow_drop_down,
                            color: tralingColor ?? Colors.white,
                            size: 25.sp,
                          )
                        ]),
                  ),
                )
              : const SizedBox.shrink(),
          SizedBox(height: 10.h),
          index == testController.selectedIndexForReview.value
              ? Row(children: [
                  Icon(
                    Icons.info_outline,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                  SizedBox(width: 10.w),
                  Text("Info",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                ])
              : const SizedBox.shrink(),
          index == testController.selectedIndexForReview.value
              ? Container(
                  padding: EdgeInsets.all(14.sp),
                  margin: EdgeInsets.symmetric(vertical: 15.h),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AppAssets.remarkBackground),
                          fit: BoxFit.fill)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Section ${index + 1}: ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: subject,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 5.0, // Space between containers horizontally
                        runSpacing: 5.0, // Space between containers vertically
                        children: List.generate(
                          testController.questionsList[index].questions!.length,
                          (i) {
                            // Get the current question
                            var question = testController
                                .questionsList[index].questions![i];

                            // Get the question ID for the current question
                            String questionId = question.questionId.toString();

                            // Determine the color based on the selection
                            Color color = testController.categoryColor(
                              subject: subject ?? "",
                              questionId: questionId, // Pass the question ID
                            )
                                ? Colors.green
                                : Colors.white;

                            // Return the container for the question
                            return Container(
                              padding: EdgeInsets.all(7.sp),
                              decoration: BoxDecoration(
                                color: color,
                                borderRadius: BorderRadius.circular(3.r),
                              ),
                              child: Text(
                                (i + 1).toString().padLeft(
                                    2, '0'), // Display index as two digits
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
