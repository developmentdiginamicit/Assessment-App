import 'package:assessili_assement_app/presentation/base_widgets/app_bar_widget.dart';
import 'package:assessili_assement_app/presentation/base_widgets/rounded_corner_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/assets_paths.dart';
import '../../../base_widgets/contaner_with_gradian_border.dart';

class QuizeSuccessWidget extends StatelessWidget {
  const QuizeSuccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBarWithProfile(),
        body: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            GradiantContainer(
              child: Column(
                children: [
                  // Popup content with gradient border
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
                              padding:
                                  EdgeInsets.only(top: 30.0.h, bottom: 20.h),
                              child: Image.asset(
                                AppAssets
                                    .successImage, // Replace with actual path
                                height: 68.h,
                                width: 68.w,
                              ),
                            ),
                            Text(
                              "Thank you for submitting your Quick Assessment!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "We appreciate you taking the time to give a rating. If you ever need more support, don’t hesitate to get in touch!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "Your Score : 3/5",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.greenAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.38,
              left: 0,
              child: Image.asset(
                AppAssets.robot, // Replace with actual path
                height: 200.h,
                width: 200.w,
              ),
            ),
          ],
        ));
  }
}
