import 'package:assessili_assement_app/constants/dimention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final String? buttonText;
  final bool isBuy;
  final bool isBorder;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? radius;
  final double? fontSize;
  final String? leftIcon;
  final double? borderWidth;
  final double? height, width;
  final FontWeight? fontWeight;
  final double? horizontlPadding;
  final double? verticalPadding;

  const CustomButton(
      {super.key,
      this.onTap,
      required this.buttonText,
      this.height,
      this.width,
      this.isBuy = false,
      this.isBorder = false,
      this.fontWeight,
      this.backgroundColor,
      this.radius,
      this.textColor,
      this.fontSize,
      this.leftIcon,
      this.borderColor,
      this.borderWidth,
      this.horizontlPadding,
      this.verticalPadding});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
      child: Container(
        height: height ?? 45.h,
        width: width ?? double.infinity,
        margin: EdgeInsets.symmetric(
            horizontal: horizontlPadding ?? 0.0,
            vertical: verticalPadding ?? 0.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: isBorder
                ? Border.all(
                    color: borderColor ?? Theme.of(context).primaryColor,
                    width: borderWidth ?? 1)
                : null,
            color: backgroundColor ?? const Color(0xFF5E16DA),
            borderRadius: BorderRadius.circular(radius != null
                ? radius!
                : isBorder
                    ? Dimensions.paddingSizeExtraSmall
                    : Dimensions.paddingSizeSmall)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leftIcon != null)
              Padding(
                padding: EdgeInsets.all(8.sp),
                child: Image.asset(leftIcon!),
              ),
            Flexible(
                child: Text(
              buttonText ?? "",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: fontSize ?? 16.sp,
                  color: textColor ?? Theme.of(context).highlightColor),
            )),
          ],
        ),
      ),
    );
  }
}
