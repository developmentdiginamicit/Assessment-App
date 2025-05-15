import 'package:assessili_assement_app/presentation/auth/controller/auth_controller.dart';
import 'package:assessili_assement_app/presentation/auth/presentation/login_screen.dart';
import 'package:assessili_assement_app/presentation/base_widgets/base_button.dart';
import 'package:assessili_assement_app/presentation/base_widgets/custom_app_bar.dart';
import 'package:assessili_assement_app/presentation/base_widgets/otp_file_widget.dart';
import 'package:assessili_assement_app/presentation/base_widgets/rounded_corner_container.dart';
import 'package:assessili_assement_app/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({super.key, required this.isCommingFrom});
  bool isCommingFrom;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool isLogin = false;
  final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradiantContainer(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 10.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(
              title: 'Email Verification',
            ),
            SizedBox(
              height: 35.h,
            ),
            const Text(
              "Enter 6 digit verification code \nsent to your email or phone",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(
              height: 30.h,
            ),
            const OtpFieldWidget(),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
              onTap: () {
                authController.sendOtp(isResend: true);
              },
              child: const Center(
                  child: Text(
                "Resend code",
                style: TextStyle(color: Colors.white),
              )),
            ),
            SizedBox(
              height: 25.h,
            ),
            CustomButton(
              onTap: () {
                navigatePushRemoveUntil(context, const LoginScreen());
               
              },
              buttonText: 'Submit OTP',
              textColor: Colors.white,
              backgroundColor: Colors.blue[800],
            ),
          ],
        ),
      )),
    );
  }
}
