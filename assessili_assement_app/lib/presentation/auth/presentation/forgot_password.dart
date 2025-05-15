import 'package:assessili_assement_app/presentation/auth/controller/auth_controller.dart';
import 'package:assessili_assement_app/presentation/auth/presentation/widgets/phone_inputfield.dart';
import 'package:assessili_assement_app/presentation/base_widgets/base_button.dart';
import 'package:assessili_assement_app/presentation/base_widgets/rounded_corner_container.dart';
import 'package:assessili_assement_app/presentation/base_widgets/text_field.dart';
import 'package:assessili_assement_app/constants/assets_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({super.key, required this.isPhoneSelected});
  bool isPhoneSelected;
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController controller = TextEditingController();
  final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradiantContainer(
          child: Padding(
        padding: EdgeInsets.all(20.sp),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.forgotPassword,
                  height: 300), // Illustration
              SizedBox(height: 50.h),
              Container(
                padding: EdgeInsets.all(15.sp),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10.r),
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF464748).withOpacity(0.3),
                      const Color(0xFF8F7AF6).withOpacity(0.5),
                      const Color(0xFF464748).withOpacity(0.3),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      widget.isPhoneSelected ? 'Phone' : 'E-mail',
                      style: const TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    widget.isPhoneSelected == true
                        ? PhoneInputfield(
                            isForget: true,
                          )
                        : CustomTextField(
                            controller: controller,
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(color: Colors.white),
                            enableBorderColor: Colors.white,
                            focusBorderColor: Colors.purple,
                            hintText: 'Enter your email',
                            border: 10.r,
                            hintStyle: const TextStyle(color: Colors.grey),
                          ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomButton(
                      onTap: () {
                        authController.sendOtp();
                      },
                      textColor: Colors.white,
                      backgroundColor: Colors.blue[700],
                      buttonText: 'Send OTP',
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
