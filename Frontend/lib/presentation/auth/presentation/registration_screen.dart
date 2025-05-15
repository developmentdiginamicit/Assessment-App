import 'package:assessili_assement_app/presentation/auth/controller/auth_controller.dart';
import 'package:assessili_assement_app/presentation/auth/presentation/login_screen.dart';
import 'package:assessili_assement_app/presentation/base_widgets/rounded_corner_container.dart';
import 'package:assessili_assement_app/utils/navigation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../base_widgets/base_button.dart';
import '../../base_widgets/text_field.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final authController = Get.put(AuthController());
  final _fromKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GradiantContainer(
            child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 10.sp),
      child: SingleChildScrollView(
        child: Obx(
          () => Form(
            key: _fromKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50.h),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                const Text(
                  "Full Name",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomTextField(
                  controller: authController.registrationnameController.value,
                  style: const TextStyle(color: Colors.white),
                  enableBorderColor: Colors.white,
                  focusBorderColor: Colors.purple,
                  // hintText: 'Password',
                  validator: (value) {
                    if (GetUtils.isNullOrBlank(value)!) {
                      return "Full name is required";
                    }
                    return null;
                  },
                  border: 10.r,
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 15.h,
                ),
                const Text(
                  "E-mail Address",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomTextField(
                  controller: authController.registrationemailController.value,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Colors.white),
                  enableBorderColor: Colors.white,
                  focusBorderColor: Colors.purple,
                  validator: (value) {
                    if (!GetUtils.isEmail(value.toString())) {
                      return "Email is not Valid";
                    }
                    return null;
                  },
                  // hintText: 'Password',
                  border: 10.r,
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 15.h,
                ),
                const Text(
                  "Board",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomTextField(
                  controller: authController.registrationboardController.value,
                  style: const TextStyle(color: Colors.white),
                  enableBorderColor: Colors.white,
                  focusBorderColor: Colors.purple,
                  sufixIcon: PopupMenuButton<String>(
                    initialValue: "CBSC",
                    color: const Color(0xFF464748),
                    icon:
                        const Icon(Icons.arrow_drop_down, color: Colors.white),
                    onSelected: (value) {
                      authController.registrationboardController.value.text =
                          value;
                    },
                    itemBuilder: (BuildContext context) {
                      return ["CBSE", "ICSE"]
                          .map((String option) => PopupMenuItem(
                                value: option,
                                child: Text(option),
                              ))
                          .toList();
                    },
                  ),
                  validator: (value) {
                    if (GetUtils.isNullOrBlank(value)!) {
                      return "Board is required";
                    }
                    return null;
                  },
                  border: 10.r,
                  hintStyle: const TextStyle(color: Colors.grey),
                ),

                // CustomTextField(
                //   controller: authController.registrationboardController.value,
                //   style: const TextStyle(color: Colors.white),
                //   enableBorderColor: Colors.white,
                //   focusBorderColor: Colors.purple,
                //   // hintText: 'Password',
                //   validator: (value) {
                //     if (GetUtils.isNullOrBlank(value)!) {
                //       return "Borard is required";
                //     }
                //     return null;
                //   },
                //   border: 10.r,
                //   hintStyle: const TextStyle(color: Colors.grey),
                // ),
                SizedBox(
                  height: 15.h,
                ),
                const Text(
                  "School",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomTextField(
                  controller: authController.registrationschoolController.value,
                  style: const TextStyle(color: Colors.white),
                  enableBorderColor: Colors.white,
                  focusBorderColor: Colors.purple,
                  // hintText: 'Password',
                  validator: (value) {
                    if (GetUtils.isNullOrBlank(value)!) {
                      return "School name is required";
                    }
                    return null;
                  },
                  border: 10.r,
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 15.h,
                ),
                const Text(
                  "Phone Number",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Container(
                      height: 50.h,
                      width: 80.w,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: '+91',
                          items:
                              <String>['+91', '+1', '+44'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(color: Colors.white),
                              ),
                            );
                          }).toList(),
                          onChanged: (_) {},
                          iconEnabledColor: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                        child: CustomTextField(
                      controller:
                          authController.registrationeditPhoneController.value,
                      keyboardType: TextInputType.phone,
                      style: const TextStyle(color: Colors.white),
                      enableBorderColor: Colors.white,
                      focusBorderColor: Colors.purple,
                      hintText: 'Enter Phone Number',
                      validator: (value) {
                        if (!GetUtils.isPhoneNumber(value)) {
                          return "Full name is required";
                        }
                        return null;
                      },
                      maxLength: 10,
                      border: 10.r,
                      hintStyle: const TextStyle(color: Colors.grey),
                    )),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                const Text(
                  "Password",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Obx(
                  () => CustomTextField(
                    obscureText: authController.isObscuredReg.value,
                    validator: (value) {
                      if (GetUtils.isNullOrBlank(value)!) {
                        return "Password is required";
                      }
                      return null;
                    },
                    sufixIcon: IconButton(
                      icon: Icon(
                        authController.isObscuredReg.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        authController.regToggleVisibility();
                      },
                    ),
                    maxLine: 1,
                    controller:
                        authController.registrationeditPasswordController.value,
                    style: const TextStyle(color: Colors.white),
                    enableBorderColor: Colors.white,
                    focusBorderColor: Colors.purple,
                    border: 10.r,
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text.rich(
                    TextSpan(
                      text: "have an account?  ",
                      style: TextStyle(color: Colors.white, fontSize: 20.sp),
                      children: [
                        TextSpan(
                          text: 'Login   ',
                          style: TextStyle(
                              color: const Color(0xFF8F7AF6),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              navigatePushRemoveUntil(
                                  context, const LoginScreen());
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (_) => const LoginScreen()));
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Obx(
                  () => authController.isRegisterButtonLoading.value
                      ? const Center(
                          child: CircularProgressIndicator.adaptive())
                      : CustomButton(
                          onTap: () {
                            if (_fromKey.currentState!.validate()) {
                              authController.registration();
                            
                            }
                          },
                          buttonText: 'Submit',
                          textColor: Colors.white,
                          backgroundColor: Colors.blue[800],
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    )));
  }
}
