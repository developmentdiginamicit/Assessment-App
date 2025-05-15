import 'package:assessili_assement_app/presentation/auth/controller/auth_controller.dart';
import 'package:assessili_assement_app/presentation/base_widgets/base_button.dart';
import 'package:assessili_assement_app/presentation/base_widgets/custom_app_bar.dart';
import 'package:assessili_assement_app/presentation/base_widgets/rounded_corner_container.dart';
import 'package:assessili_assement_app/presentation/base_widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradiantContainer(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(
                  title: 'Reset Password',
                ),
                SizedBox(
                  height: 30.h,
                ),
                const Text(
                  "Enter 6 Digit Password",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20.h,
                ),
                const Text(
                  "New Password",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Obx(() => CustomTextField(
                      obscureText: authController.isObscuredNewPassword.value,
                      sufixIcon: IconButton(
                        icon: Icon(
                          authController.isObscuredNewPassword.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white,
                        ),
                        onPressed: authController.toggleNewPasswordVisibility,
                      ),
                      maxLine: 1,
                      controller: authController.newPasswordController.value,
                      style: const TextStyle(color: Colors.white),
                      enableBorderColor: Colors.white,
                      focusBorderColor: Colors.purple,
                      border: 10.r,
                      hintStyle: const TextStyle(color: Colors.grey),
                    )),
                SizedBox(
                  height: 20.h,
                ),
                const Text(
                  "Confirm Password",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Obx(() => CustomTextField(
                      obscureText:
                          authController.isObscuredConfirmPassword.value,
                      sufixIcon: IconButton(
                        icon: Icon(
                          authController.isObscuredConfirmPassword.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white,
                        ),
                        onPressed:
                            authController.toggleConfirmPasswordVisibility,
                      ),
                      maxLine: 1,
                      controller:
                          authController.confirmPasswordController.value,
                      style: const TextStyle(color: Colors.white),
                      enableBorderColor: Colors.white,
                      focusBorderColor: Colors.purple,
                      border: 10.r,
                      hintStyle: const TextStyle(color: Colors.grey),
                    )),
                SizedBox(
                  height: 15.h,
                ),
                CustomButton(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (_) =>  ResetPasswordScreen()));
                  },
                  textColor: Colors.white,
                  backgroundColor: Colors.blue[700],
                  buttonText: 'Submit',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
