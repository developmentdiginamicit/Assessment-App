import 'package:assessili_assement_app/presentation/base_widgets/rounded_corner_container.dart';
import 'package:assessili_assement_app/presentation/home/presentation/home_screen.dart';
import 'package:assessili_assement_app/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../constants/assets_paths.dart';
import '../../../base_widgets/contaner_with_gradian_border.dart';

class SubmmitAssessmentScreen extends StatelessWidget {
  const SubmmitAssessmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      navigatePushRemoveUntil(Get.context!, HomeScreen());
    });

    return Scaffold(
      body: GradiantContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: ContainerWithGradientBorder(
                child: Padding(
                  padding: EdgeInsets.all(10.0.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 30.0.h, bottom: 20.h),
                        child: Image.asset(
                          AppAssets.successImage, // Replace with actual path
                          height: 68.h,
                          width: 68.w,
                        ),
                      ),
                      Text(
                        "Thank you for submitting your review!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "We appreciate you taking the time to give a rating. If you ever need more support, don’t hesitate to get in touch!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Image.asset(
              AppAssets.submmitAssesment, // Replace with actual path
            ),
          ],
        ),
      ),
    );
  }
}
