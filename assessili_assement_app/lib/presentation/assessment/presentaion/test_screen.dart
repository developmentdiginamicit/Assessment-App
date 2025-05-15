import 'dart:developer';
import 'package:assessili_assement_app/presentation/base_widgets/base_button.dart';
import 'package:assessili_assement_app/presentation/base_widgets/custom_popup_menu_button.dart';
import 'package:assessili_assement_app/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:assessili_assement_app/presentation/assessment/controller/assessment_controller.dart';
import 'package:assessili_assement_app/presentation/assessment/presentaion/test_category_screen.dart';
import 'package:assessili_assement_app/presentation/assessment/presentaion/widgets/question_widget.dart';
import 'package:assessili_assement_app/presentation/base_widgets/rounded_corner_container.dart';
import 'package:assessili_assement_app/constants/assets_paths.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key, required this.duration});

  final String duration;

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final testController = Get.put(AssessmentController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await testController
          .getAllQuestion(assessmentId: testController.assementID.value)
          .then((value) {
        testController.startTimer(widget.duration);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return onWillPop(context);
      },
      child: Scaffold(
        // appBar: CustomAppBarWithProfile(),
        body: GradiantContainer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 40.h),
                Padding(
                  padding: EdgeInsets.all(18.sp),
                  child: Row(
                    children: [
                      Obx(
                        () => RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Section : ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: testController.slectedSubject.value,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Obx(() => CustomMenuButton(
                            options: testController.subjectList.value,
                            onSelected: (String value) {
                              testController.slectedSubject.value = value;
                              testController.fileterQuestion(
                                  subject: testController.slectedSubject.value);
                              testController.currentPage.value = 0;
                              testController.selectedSubjectIndex.value =
                                  testController.subjectList.indexOf(value);
                            },
                          )),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => TestCategoryScreen(),
                            ),
                          );
                        },
                        child: Image.asset(
                          AppAssets.fileDoc,
                          height: 31.h,
                          width: 27.w,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.timer_outlined,
                      color: Colors.grey,
                      size: 20.sp,
                    ),
                    SizedBox(width: 8.w),
                    Obx(() => RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Time left: ',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: testController.timeDuration.value,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
                Container(
                  width: double.infinity,
                  margin:
                      EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0x66603dc8),
                  ),
                  child: Obx(
                    () => Text(
                      "Question ${testController.currentPage.value + 1}/${testController.questions.length}",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                // PageView to display questions
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  height: 500.h,
                  child: Obx(
                    () => PageView.builder(
                      controller: testController.pageController.value,
                      physics:
                          const NeverScrollableScrollPhysics(), // Disable swipe if necessary.
                      itemCount: testController.questions.length,
                      onPageChanged: (index) {},
                      itemBuilder: (context, index) {
                        return Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(10.sp),
                          margin: EdgeInsets.symmetric(horizontal: 10.w),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(AppAssets.testBackground),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                QuestionWidget(
                                  page: index + 1,
                                  questions: testController.questions[index],
                                  slectedSubject:
                                      testController.slectedSubject.value,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                // Bottom navigation row
                Obx(() => Row(
                      children: [
                        // Previous Button
                        testController.removeLeftIcon.value
                            ? SizedBox(width: 20.w)
                            : IconButton(
                                onPressed: () {
                                  testController.goToPreviousPage(
                                      testController.questions.length);
                                },
                                icon: Icon(
                                  Icons.arrow_circle_left_outlined,
                                  color: Colors.white,
                                  size: 50.sp,
                                ),
                              ),

                        // Review Button
                        testController.removeRightIcon.value
                            ? Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 40.0.w),
                                  child: CustomButton(
                                    onTap: () {
                                      log("Review button clicked!");
                                    },
                                    buttonText: "Submit",
                                    textColor: Colors.white,
                                  ),
                                ),
                              )
                            : Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 40.0.w),
                                  child: CustomButton(
                                    onTap: () {
                                      log(testController.selectedAnswer.value
                                          .toString());
                                      log("Review button clicked!");
                                    },
                                    buttonText: "Review",
                                    textColor: Colors.white,
                                  ),
                                ),
                              ),

                        // Next or Finish Button
                        testController.removeRightIcon.value
                            ? const SizedBox.shrink()
                            : IconButton(
                                onPressed: () {
                                  testController.goToNextPage(
                                      testController.questions.length);
                                },
                                icon: Icon(
                                  Icons.arrow_circle_right_outlined,
                                  color: Colors.white,
                                  size: 50.sp,
                                ),
                              ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
