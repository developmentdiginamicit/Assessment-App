import 'package:assessili_assement_app/constants/assets_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<void> loadingDialog(
    {required BuildContext context, required String text}) async {
  showDialog(
    context: context,
    // barrierDismissible: false,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      // Automatically close the dialog after 5 seconds
      Future.delayed(const Duration(seconds: 5), () {
        Navigator.of(Get.context!); // Close the dialog
      });
      return Dialog(
        backgroundColor:
            Colors.transparent, // Makes the dialog background transparent
        child: Container(
            // Set the height of the popup
            width: MediaQuery.of(context).size.width,
            height: 200.h,
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 25.h),
            decoration: BoxDecoration(
              color: Colors.white,
              // image: const DecorationImage(
              //   image: AssetImage(AppAssets
              //       .remarkBackground), // Path to your background image
              //   fit: BoxFit.fill,
              // ),
              borderRadius: BorderRadius.circular(15.r), // Rounded corners
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.loaderIcon,
                  height: 60.h,
                  width: 50.w,
                ),
                SizedBox(height: 20.h),
                Text(text,
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black))
              ],
            )),
      );
    },
  );
}
