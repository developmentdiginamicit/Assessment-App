import 'package:assessili_assement_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomiconButton extends StatelessWidget {
  CustomiconButton(
      {super.key,
      required this.icon,
      required this.onPressed,
      this.color,
      this.padding,
      this.size});
  IconData? icon;
  Color? color;
  void Function()? onPressed;
  double? padding;
  double? size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.all(padding ?? 8.0.sp),
        child: Icon(
          icon,
          size: size ?? 15.sp,
          color: color ?? AppColors.whiteColor,
        ),
      ),
    );
  }
}
