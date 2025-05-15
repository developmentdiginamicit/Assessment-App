import 'package:assessili_assement_app/presentation/assessment/controller/assessment_controller.dart';
import 'package:assessili_assement_app/presentation/assessment/presentaion/widgets/category_card.dart';
import 'package:assessili_assement_app/presentation/base_widgets/app_bar_widget.dart';
import 'package:assessili_assement_app/presentation/base_widgets/base_button.dart';
import 'package:assessili_assement_app/presentation/base_widgets/rounded_corner_container.dart';
import 'package:assessili_assement_app/constants/assets_paths.dart';
import 'package:assessili_assement_app/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../base_widgets/circular_progress.dart';

class TestCategoryScreen extends StatefulWidget {
  const TestCategoryScreen({super.key});

  @override
  State<TestCategoryScreen> createState() => _TestCategoryScreenState();
}

class _TestCategoryScreenState extends State<TestCategoryScreen> {
  final testController = Get.put(AssessmentController());

  @override
  Widget build(BuildContext context) {
    int attemptedQuestions = 0;
    for (var subject in testController.selectedAnswer.keys) {
      var answersMap = testController.selectedAnswer[subject]!;
      for (var answer in answersMap.values) {
        if (answer.optionId != null && answer.optionId.toString().isNotEmpty) {
          attemptedQuestions++;
        }
      }
    }

    print("Total Attempted Questions: $attemptedQuestions");
    return Scaffold(
      appBar: CustomAppBarWithProfile(),
      body: GradiantContainer(
        child: Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0.w, vertical: 10.h),
                        child: Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Section 1: ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 23.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Biology',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // CustomMenuButton(),
                            const Spacer(),
                            Image.asset(
                              AppAssets.fileDoc,
                              height: 31.h,
                              width: 27.w,
                            )
                          ],
                        ),
                      ),
                      Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(17.sp),
                          margin: EdgeInsets.only(
                              left: 10.w, right: 10.w, top: 10.h, bottom: 30.h),
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(AppAssets.testBackground),
                                  fit: BoxFit.fill)),
                          child: Column(
                            children: [
                              Obx(() => Column(
                                      children: List.generate(
                                    testController.subjectList.length,
                                    (int index) => CategoryCardWidget(
                                      index: index,
                                      subject:
                                          testController.subjectList[index],
                                    ),
                                  ))),
                              SizedBox(height: 10.h),
                              CustomButton(
                                onTap: () {
                                  confirmationDialog(
                                      context, attemptedQuestions);
                                },
                                buttonText: "Submit",
                                textColor: Colors.white,
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// review question dialog
  void confirmationDialog(BuildContext context, int attemptedQuestions) {
    showDialog(
      context: context,
      // barrierDismissible: false,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor:
              Colors.transparent, // Makes the dialog background transparent
          child: Container(
            // Set the height of the popup
            width: MediaQuery.of(context).size.width,
            height: 250.h,
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 25.h),
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(AppAssets
                    .remarkBackground), // Path to your background image
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(15.r), // Rounded corners
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                QuestionProgressWidget(
                  completedQuestions: attemptedQuestions,
                  totalQuestions: testController.totalQuestions.value,
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 20.r,
                      backgroundColor: Colors.green.withOpacity(0.5),
                      child: Icon(
                        Icons.file_copy,
                        size: 15.sp,
                        color: Colors.white,
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'attempted\n',
                            style: TextStyle(
                              color: const Color(0xFFA5AAB5),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: '$attemptedQuestions question',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10.w),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 20.r,
                      backgroundColor: const Color(0xFFA7CCF2),
                      child: Icon(
                        Icons.file_copy,
                        size: 15.sp,
                        color: Colors.white,
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Unattempted\n',
                            style: TextStyle(
                              color: const Color(0xFFA5AAB5),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text:
                                '${testController.totalQuestions.value - attemptedQuestions} question',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0.h),
                child: Text("Do u still want to submit?",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
              ),
              Row(children: [
                Expanded(
                  child: CustomButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    buttonText: "Go back",
                    textColor: Colors.purple,
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(width: 40.w),
                Expanded(
                    child: CustomButton(
                  buttonText: "Submit",
                  textColor: Colors.white,
                  onTap: () {
                    backNavigation(context);
                    testController.submitExam();
                  },
                ))
              ])
            ]),
          ),
        );
      },
    );
  }

  /// loader dialog
}
