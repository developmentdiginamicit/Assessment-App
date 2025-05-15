import 'package:assessili_assement_app/constants/colors.dart';
import 'package:assessili_assement_app/presentation/assessment/controller/assessment_controller.dart';
import 'package:assessili_assement_app/presentation/assessment/presentaion/test_screen.dart';
import 'package:assessili_assement_app/presentation/base_widgets/app_bar_widget.dart';
import 'package:assessili_assement_app/presentation/base_widgets/rounded_corner_container.dart';
import 'package:assessili_assement_app/constants/assets_paths.dart';
import 'package:assessili_assement_app/presentation/base_widgets/toast_widget.dart';
import 'package:assessili_assement_app/utils/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../base_widgets/base_button.dart';

class AssesmentIntroScreen extends StatefulWidget {
  AssesmentIntroScreen({super.key, required this.assessmentId});

  String assessmentId;
  @override
  State<AssesmentIntroScreen> createState() => _AssesmentIntroScreenState();
}

class _AssesmentIntroScreenState extends State<AssesmentIntroScreen> {
  final assesmentController = Get.put(AssessmentController());
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((v) {
      assesmentController
          .getAssessmentIntro(assessmentId: widget.assessmentId)
          .then((v) {
        assesmentController.startTimerIntro(assesmentController
                .introModel.value?.data?.assessmentInstructions?.dynamicTime ??
            "");
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithProfile(
        title: assesmentController
                .introModel.value?.data?.assessmentInstructions?.dynamicTime ??
            "",
      ),
      body: GradiantContainer(
          child: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: Obx(
          () => assesmentController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 20.w, right: 20.w, top: 15.h, bottom: 5.h),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                  image: AssetImage(
                                      AppAssets.assessmentIntroBackground),
                                  fit: BoxFit.fitWidth)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                      assesmentController.introModel.value?.data
                                              ?.asssessmentDisplayName ??
                                          "",
                                      style: TextStyle(
                                          fontSize: 28.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white)),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Obx(() => Text(
                                      assesmentController.introTimer.value ??
                                          "",
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white))),
                                ),
                                SizedBox(height: 20.h),
                                Text(
                                  "Exam Conduct",
                                  style: TextStyle(
                                      fontSize: 22.sp, color: Colors.white),
                                ),
                                Text(
                                  "1. Environment",
                                  style: TextStyle(
                                      fontSize: 18.sp, color: Colors.white),
                                ),
                                Column(
                                  children: List.generate(
                                    assesmentController
                                            .introModel
                                            .value
                                            ?.data
                                            ?.assessmentInstructions
                                            ?.instructions
                                            ?.examConduct
                                            ?.environment
                                            ?.length ??
                                        0,
                                    (int index) {
                                      // Access each environment item using the index
                                      String environmentItem =
                                          assesmentController
                                                  .introModel
                                                  .value
                                                  ?.data
                                                  ?.assessmentInstructions
                                                  ?.instructions
                                                  ?.examConduct
                                                  ?.environment?[index] ??
                                              '';
                                      return Text(
                                        " * $environmentItem",
                                        style: TextStyle(
                                            color: AppColors.whiteColor,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w300),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  "2. Communication",
                                  style: TextStyle(
                                      fontSize: 18.sp, color: Colors.white),
                                ),
                                Column(
                                  children: List.generate(
                                    assesmentController
                                            .introModel
                                            .value
                                            ?.data
                                            ?.assessmentInstructions
                                            ?.instructions
                                            ?.examConduct
                                            ?.communication
                                            ?.length ??
                                        0,
                                    (int index) {
                                      // Access each environment item using the index
                                      String communicationItem =
                                          assesmentController
                                                  .introModel
                                                  .value
                                                  ?.data
                                                  ?.assessmentInstructions
                                                  ?.instructions
                                                  ?.examConduct
                                                  ?.communication?[index] ??
                                              '';
                                      return Text(
                                        " * $communicationItem",
                                        style: TextStyle(
                                            color: AppColors.whiteColor,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w300),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  "3. Materials",
                                  style: TextStyle(
                                      fontSize: 18.sp, color: Colors.white),
                                ),
                                Column(
                                  children: List.generate(
                                    assesmentController
                                            .introModel
                                            .value
                                            ?.data
                                            ?.assessmentInstructions
                                            ?.instructions
                                            ?.examConduct
                                            ?.materials
                                            ?.length ??
                                        0,
                                    (int index) {
                                      // Access each environment item using the index
                                      String materialItem = assesmentController
                                              .introModel
                                              .value
                                              ?.data
                                              ?.assessmentInstructions
                                              ?.instructions
                                              ?.examConduct
                                              ?.materials?[index] ??
                                          '';
                                      return Text(
                                        " * $materialItem",
                                        style: TextStyle(
                                            color: AppColors.whiteColor,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w300),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                Text(
                                  "Exam Instructions",
                                  style: TextStyle(
                                      fontSize: 22.sp, color: Colors.white),
                                ),
                                Text(
                                  "1. Timing",
                                  style: TextStyle(
                                      fontSize: 18.sp, color: Colors.white),
                                ),
                                Column(
                                  children: List.generate(
                                    assesmentController
                                            .introModel
                                            .value
                                            ?.data
                                            ?.assessmentInstructions
                                            ?.instructions
                                            ?.examInstructions
                                            ?.timing
                                            ?.length ??
                                        0,
                                    (int index) {
                                      // Access each environment item using the index
                                      String environmentItem =
                                          assesmentController
                                                  .introModel
                                                  .value
                                                  ?.data
                                                  ?.assessmentInstructions
                                                  ?.instructions
                                                  ?.examInstructions
                                                  ?.timing?[index] ??
                                              '';
                                      return Text(
                                        " * $environmentItem",
                                        style: TextStyle(
                                            color: AppColors.whiteColor,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w300),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  "2. Browser and Timer",
                                  style: TextStyle(
                                      fontSize: 18.sp, color: Colors.white),
                                ),
                                Column(
                                  children: List.generate(
                                    assesmentController
                                            .introModel
                                            .value
                                            ?.data
                                            ?.assessmentInstructions
                                            ?.instructions
                                            ?.examInstructions
                                            ?.browserAndTimer
                                            ?.length ??
                                        0,
                                    (int index) {
                                      // Access each environment item using the index
                                      String communicationItem =
                                          assesmentController
                                                  .introModel
                                                  .value
                                                  ?.data
                                                  ?.assessmentInstructions
                                                  ?.instructions
                                                  ?.examInstructions
                                                  ?.browserAndTimer?[index] ??
                                              '';
                                      return Text(
                                        " * $communicationItem",
                                        style: TextStyle(
                                            color: AppColors.whiteColor,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w300),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  "3. Submission",
                                  style: TextStyle(
                                      fontSize: 18.sp, color: Colors.white),
                                ),
                                Column(
                                  children: List.generate(
                                    assesmentController
                                            .introModel
                                            .value
                                            ?.data
                                            ?.assessmentInstructions
                                            ?.instructions
                                            ?.examInstructions
                                            ?.submission
                                            ?.length ??
                                        0,
                                    (int index) {
                                      // Access each environment item using the index
                                      String materialItem = assesmentController
                                              .introModel
                                              .value
                                              ?.data
                                              ?.assessmentInstructions
                                              ?.instructions
                                              ?.examInstructions
                                              ?.submission?[index] ??
                                          '';
                                      return Text(
                                        " * $materialItem",
                                        style: TextStyle(
                                            color: AppColors.whiteColor,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w300),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                Text(
                                  "Declaration",
                                  style: TextStyle(
                                      fontSize: 22.sp, color: Colors.white),
                                ),
                                Column(
                                  children: List.generate(
                                    assesmentController
                                            .introModel
                                            .value
                                            ?.data
                                            ?.assessmentInstructions
                                            ?.instructions
                                            ?.declaration
                                            ?.length ??
                                        0,
                                    (int index) {
                                      // Access each environment item using the index
                                      String environmentItem =
                                          assesmentController
                                                  .introModel
                                                  .value
                                                  ?.data
                                                  ?.assessmentInstructions
                                                  ?.instructions
                                                  ?.declaration?[index] ??
                                              '';
                                      return Text(
                                        " * $environmentItem",
                                        style: TextStyle(
                                            color: AppColors.whiteColor,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w300),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                Container(
                                  padding: EdgeInsets.only(
                                      top: 10.h, right: 10.w, bottom: 10.h),
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple,
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  child: Row(children: [
                                    Obx(() => CupertinoCheckbox(
                                        value: assesmentController
                                            .isReadInstruction.value,
                                        onChanged: (v) {
                                          assesmentController
                                              .readAssessment(v ?? false);
                                          assesmentController.assementID.value =
                                              assesmentController
                                                      .introModel
                                                      .value
                                                      ?.data
                                                      ?.assessmentId ??
                                                  "";
                                        })),
                                    Expanded(
                                      child: Text(
                                          assesmentController
                                                  .introModel
                                                  .value
                                                  ?.data!
                                                  .assessmentInstructions
                                                  ?.instructions
                                                  ?.declaration?[0] ??
                                              "",
                                          style: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white)),
                                    )
                                  ]),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.h, horizontal: 50.w),
                                  child: CustomButton(
                                      onTap: () {
                                        if (assesmentController
                                            .isReadInstruction.value) {
                                          navigatePushReplacement(
                                              context,
                                              TestScreen(
                                                duration: assesmentController
                                                        .introModel
                                                        .value
                                                        ?.data!
                                                        .assessmentDuration ??
                                                    "00",
                                              ));
                                        } else {
                                          TostWidget().errorToast(
                                              title: "Instruction",
                                              message:
                                                  "please Read Instruction and check before Exam");
                                        }
                                      },
                                      textColor: Colors.white,
                                      backgroundColor: assesmentController
                                              .isReadInstruction.value
                                          ? null
                                          : AppColors.disableColor,
                                      buttonText: "Start Assessment"),
                                )
                              ]),
                        ),
                      ),
                    )
                  ],
                ),
        ),
      )),
    );
  }
}
