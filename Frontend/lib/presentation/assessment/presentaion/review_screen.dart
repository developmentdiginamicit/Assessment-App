import 'package:assessili_assement_app/constants/colors.dart';
import 'package:assessili_assement_app/presentation/assessment/controller/assessment_controller.dart';
import 'package:assessili_assement_app/presentation/base_widgets/app_bar_widget.dart';
import 'package:assessili_assement_app/presentation/base_widgets/base_button.dart';
import 'package:assessili_assement_app/presentation/base_widgets/rounded_corner_container.dart';
import 'package:assessili_assement_app/constants/assets_paths.dart';
import 'package:assessili_assement_app/presentation/base_widgets/text_field.dart';
import 'package:assessili_assement_app/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../base_widgets/custom_appbar.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final testController = Get.put(AssessmentController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return onWillPop(context);
      },
      child: Scaffold(
        appBar: CustomAppBarWithProfile(),
        body: GradiantContainer(
          child: Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          vertical: 50.sp, horizontal: 30.w),
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 30.h),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppAssets.testBackground),
                              fit: BoxFit.fill)),
                      child: Column(
                        children: [
                          Image.asset(
                            AppAssets.logo,
                            height: 50.h,
                            width: 50.w,
                          ),
                          SizedBox(height: 20.h),
                          Text("How was your experience with Assessli?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.w500,
                              )),
                          SizedBox(height: 20.h),
                          Center(
                            child: RatingBar.builder(
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                testController.ratirn.value = rating;
                              },
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Write your review",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.whiteColor)),
                          ),
                          SizedBox(height: 10.h),
                          CustomTextField(
                            controller: testController.reviewController.value,
                            border: 10.sp,
                            fillColor: Colors.grey.withOpacity(0.5),
                            filled: true,
                            maxLine: 3,
                          ),
                          SizedBox(height: 100.h),
                          CustomButton(
                            onTap: () {
                              testController.reviewPost();
                            },
                            buttonText: "Submit",
                            textColor: Colors.white,
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 50.h,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// loader dialog
}
