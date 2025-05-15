import 'dart:ui';
import 'package:assessili_assement_app/constants/assets_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TraitInfoCardWidget extends StatelessWidget {
  TraitInfoCardWidget(
      {super.key, this.description, this.factorsAffectingTrait, this.title});

  String? title;
  String? description;
  List<String>? factorsAffectingTrait;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.sp),
      margin: EdgeInsets.only(bottom: 25.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          image: const DecorationImage(
              image: AssetImage(AppAssets.traitBackground), fit: BoxFit.fill)),
      child: Column(children: [
        Row(children: [
          Image.asset(
            AppAssets.loginICon,
            height: 22.h,
            width: 12.w,
          ),
          SizedBox(width: 10.w),
          Text(
            title ?? "",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600),
          )
        ]),
        SizedBox(height: 10.h),
        Text(description ?? "",
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white)),
        SizedBox(height: 20.h),
        GestureDetector(
          onTap: () {
            showPopupDialog(
                context: context,
                title: title ?? "",
                details: factorsAffectingTrait ?? []);
          },
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Text("Factors Affecting Trait",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: const Color(0xffBF9AFF),
                  fontWeight: FontWeight.w600,
                )),
            SizedBox(width: 5.w),
            Icon(
              Icons.info_outline,
              size: 12.sp,
              color: const Color(0xffBF9AFF),
            )
          ]),
        )
      ]),
    );
  }

  void showPopupDialog(
      {required BuildContext context,
      required String title,
      required List<String> details}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor:
              Colors.transparent, // Makes the dialog background transparent
          child: BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: 5, sigmaY: 5, tileMode: TileMode.mirror),
            child: Container(
              // Set the height of the popup
              width: double.infinity,
              height: 300.h,
              padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(AppAssets
                      .popupBackground), // Path to your background image
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(15.r), // Rounded corners
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      // BackdropFilter(
                      //   filter: ImageFilter.blur(
                      //       sigmaX: 5, sigmaY: 5), // Adjust the blur intensity here
                      //   child: Container(
                      //     color: Colors.transparent// Dark overlay for the blur
                      //   ),
                      // ),
                      Image.asset(
                        AppAssets.loginICon,
                        height: 22.h,
                        width: 12.w,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.cancel_outlined,
                            color: Colors.white,
                            size: 20.sp,
                          ))
                    ]),
                    SizedBox(height: 10.h),
                    Text(
                      "Factors Affecting Traits:",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    SizedBox(height: 20.h),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(
                          details.length,
                          (v) => Text(
                            "*  ${details[v]}",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ))
                  ]),
            ),
          ),
        );
      },
    );
  }
}
