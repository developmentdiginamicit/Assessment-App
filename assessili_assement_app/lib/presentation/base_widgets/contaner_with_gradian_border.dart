import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerWithGradientBorder extends StatelessWidget {
  ContainerWithGradientBorder(
      {super.key,
      required this.child,
      this.height,
      this.width,
      this.gradianColor});

  Widget child;
  double? height;
  double? width;
  List<Color>? gradianColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.sp),
      margin: EdgeInsets.only(top: 20.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: gradianColor ??
                [const Color(0xff5e16da), const Color(0xff553de6), const Color(0xff1ef4f2)],
          )),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(13.r),
        ),
        child: child,
      ),
    );
  }
}
