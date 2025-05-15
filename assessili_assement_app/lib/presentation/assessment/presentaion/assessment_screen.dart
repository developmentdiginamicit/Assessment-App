import 'package:assessili_assement_app/presentation/assessment/controller/assessment_controller.dart';
import 'package:assessili_assement_app/presentation/assessment/presentaion/assesment_intro.dart';
import 'package:assessili_assement_app/presentation/assessment/presentaion/widgets/subscription_widget.dart';
import 'package:assessili_assement_app/presentation/base_widgets/app_bar_widget.dart';
import 'package:assessili_assement_app/presentation/base_widgets/base_button.dart';
import 'package:assessili_assement_app/presentation/base_widgets/rounded_corner_container.dart';
import 'package:assessili_assement_app/constants/assets_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AssessmentScreen extends StatefulWidget {
  const AssessmentScreen({super.key});

  @override
  State<AssessmentScreen> createState() => _AssessmentScreenState();
}

class _AssessmentScreenState extends State<AssessmentScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  final assessmentController = Get.put(AssessmentController());
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((v) {
      assessmentController.getAllAssement();
    });

    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithProfile(),
      body: GradiantContainer(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Take Assessments",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 15.h),
              Expanded(
                child: Obx(
                  () => assessmentController.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator.adaptive())
                      : ListView.builder(
                          padding: EdgeInsets.zero,
                          physics:
                              const BouncingScrollPhysics(), // Allow scrolling within ListView
                          itemCount: assessmentController.assessmentList.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (assessmentController
                                            .assessmentList[index].status
                                            ?.contains("completed") ==
                                        true) {
                                    } else if (assessmentController
                                            .assessmentList[index].status
                                            ?.contains("unlocked") ==
                                        true) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AssesmentIntroScreen(
                                                      assessmentId:
                                                          assessmentController
                                                                  .assessmentList[
                                                                      index]
                                                                  .assessmentId ??
                                                              "")));
                                    } else if (assessmentController
                                            .assessmentList[index].status
                                            ?.contains("locked") ==
                                        true) {
                                      _warningDialog(context);
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(15.sp),
                                    margin: EdgeInsets.only(bottom: 10.h),
                                    decoration: const BoxDecoration(
                                      // borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              AppAssets.smallContainer),
                                          fit: BoxFit.fitWidth),
                                    ),
                                    child: Row(
                                      children: [
                                        const CircleAvatar(
                                          backgroundColor: Color(0xFF5517C0),
                                          child: Center(
                                            child: Icon(
                                              Icons.edit,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        Text(
                                          assessmentController
                                                  .assessmentList[index]
                                                  .assessmentDisplayName ??
                                              "",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        const Spacer(),
                                        assessmentController
                                                    .assessmentList[index]
                                                    .status
                                                    ?.contains("completed") ==
                                                true
                                            ? const Icon(
                                                Icons.check,
                                                color: Colors.lightGreen,
                                                size: 25,
                                              )
                                            : assessmentController
                                                        .assessmentList[index]
                                                        .status
                                                        ?.contains(
                                                            "unlocked") ==
                                                    true
                                                ? const Icon(
                                                    Icons.lock_open_sharp,
                                                    color: Colors.lightBlue,
                                                    size: 25,
                                                  )
                                                : const Icon(
                                                    Icons.lock,
                                                    color: Colors.lightBlue,
                                                    size: 25,
                                                  ),
                                        const Icon(
                                          Icons.arrow_drop_down,
                                          size: 40,
                                          color: Colors.lightBlue,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                if (assessmentController
                                            .assessmentList[index].status !=
                                        null &&
                                    assessmentController
                                        .assessmentList[index].status!
                                        .contains("unlocked"))
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(20.0),
                                    margin: EdgeInsets.symmetric(vertical: 5.h),
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              AppAssets.smallContainer),
                                          fit: BoxFit.fill),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          assessmentController
                                                  .assessmentList[index]
                                                  .assessmentTitle ??
                                              "",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                          assessmentController
                                                  .assessmentList[index]
                                                  .assessmentDescription ??
                                              "",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to show warning dialog
  void _warningDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // Rounded corners
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF1A002E), // Top color (dark purple)
                  Color(0xFF4C00E3), // Bottom color (lighter purple)
                ],
              ),
              borderRadius: BorderRadius.circular(15), // Rounded corners
              // border: Border.all(color: Colors.white, width: 0.2), // White border
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const CircleAvatar(
                        radius: 12,
                        child: Center(
                          child: Icon(
                            Icons.close,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Image.asset(
                    AppAssets.lock,
                    height: 135.h,
                    width: 130.w,
                  ),
                  SizedBox(height: 10.h),
                  const Text(
                    "Oops,",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      "This assignment is locked!\nHead over to our subscription page\nto unlock it.",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  CustomButton(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SubscriptionScreen()));
                    },
                    buttonText: 'Visit Now',
                    textColor: Colors.white,
                    backgroundColor: Colors.deepPurpleAccent,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
