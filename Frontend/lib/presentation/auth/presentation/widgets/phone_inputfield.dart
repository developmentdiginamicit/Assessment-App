import 'package:assessili_assement_app/presentation/auth/controller/auth_controller.dart';
import 'package:assessili_assement_app/presentation/base_widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PhoneInputfield extends StatelessWidget {
  PhoneInputfield({super.key, this.isForget = false});
  bool isForget;
  final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 50.h,
              width: 80.w,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: '+91',
                  dropdownColor: const Color(0xFF464748),
                  items: <String>['+91', '+1', '+44'].map((String value) {
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
            const SizedBox(width: 10),
            Obx(
              () => Expanded(
                child: CustomTextField(
                  maxLength: 10,
                  hintText: "Enter phone number",
                  validator: (value) {
                    if (!GetUtils.isPhoneNumber(value)) {
                      return "Enter valid phone";
                    }
                    return null;
                  },
                  maxLine: 1,
                  controller: authController.loginPhoneController.value,
                  style: const TextStyle(color: Colors.white),
                  enableBorderColor: Colors.white,
                  focusBorderColor: Colors.purple,
                  border: 10.r,
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        isForget
            ? const SizedBox.shrink()
            : const Text(
                "Password",
                style: TextStyle(color: Colors.white),
              ),
        SizedBox(height: 10.h),
        isForget
            ? const SizedBox.shrink()
            : Obx(() => CustomTextField(
                  hintText: "Enter Password",
                  obscureText: authController.isObscuredLogin.value,
                  validator: (value) {
                    if (GetUtils.isNullOrBlank(value)!) {
                      return "Password is required";
                    }
                    return null;
                  },
                  sufixIcon: IconButton(
                    icon: Icon(
                      authController.isObscuredLogin.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      authController.loginToggleVisibility();
                    },
                  ),
                  maxLine: 1,
                  controller: authController.loginPasswordController.value,
                  style: const TextStyle(color: Colors.white),
                  enableBorderColor: Colors.white,
                  focusBorderColor: Colors.purple,
                  border: 10.r,
                  hintStyle: const TextStyle(color: Colors.grey),
                ))
      ],
    );
  }
}
