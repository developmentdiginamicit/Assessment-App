import 'package:assessili_assement_app/presentation/base_widgets/avatar_image_showing.dart';
import 'package:assessili_assement_app/constants/assets_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      SizedBox(
        height: 41.h,
        width: 42.w,
        child: Image.asset(
          AppAssets.logo,
        ),
      ),
      ProfileAvatarWidget(
        radius: 20.r,
        image: AppAssets.profile,
      )
    ]);
  }
}
