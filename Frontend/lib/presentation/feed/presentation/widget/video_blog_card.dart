import 'package:assessili_assement_app/constants/assets_paths.dart';
import 'package:assessili_assement_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../base_widgets/contaner_with_gradian_border.dart';
import '../../../base_widgets/customIcon_button.dart';

class VideoBlogCardWidget extends StatelessWidget {
  const VideoBlogCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                  "NEET Syllabus 2025 PDF by NTA, Download Subject wise New Syllabus",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w500,
                  )),
              Row(
                children: [
                  Image.asset(
                    AppAssets.logo,
                    height: 20.h,
                    width: 20.w,
                  ),
                  SizedBox(width: 10.w),
                  Text("PW Live 2 days ago",
                      style: TextStyle(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.whiteColor)),
                ],
              ),
              Row(children: [
                CustomiconButton(
                  icon: Icons.thumb_up_off_alt,
                  onPressed: () {},
                ),
                CustomiconButton(
                  icon: Icons.thumb_down_off_alt,
                  onPressed: () {},
                ),
                CustomiconButton(
                  icon: Icons.share,
                  onPressed: () {},
                ),
              ]),
            ],
          ),
        ),
        ContainerWithGradientBorder(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100.h,
              width: 100.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/banner.png"),
                  fit: BoxFit.cover, // Change to cover if needed
                ),
              ),
              child: Center(
                child: Image.asset(
                  AppAssets.playButton,
                  height: 30.h,
                  width: 30.w,
                  // Change fit according to your needs
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
