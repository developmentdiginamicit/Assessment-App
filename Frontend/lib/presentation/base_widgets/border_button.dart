import 'package:assessili_assement_app/constants/dimention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBorderButton extends StatelessWidget {
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

  const CustomBorderButton(
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
      this.borderWidth});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
      child: Container(
        height: height ?? 45.h,
        width: width ?? double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: isBorder
                ? Border.all(
                    color: borderColor ?? Theme.of(context).primaryColor,
                    width: borderWidth ?? 1)
                : null,
            color: backgroundColor ?? Theme.of(context).primaryColor,
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
                padding: const EdgeInsets.only(right: 5),
                child: SizedBox(
                    width: 30.w,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(leftIcon!),
                    )),
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
