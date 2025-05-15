import 'package:assessili_assement_app/presentation/auth/controller/auth_controller.dart';
import 'package:assessili_assement_app/presentation/auth/presentation/forgot_password.dart';
import 'package:assessili_assement_app/presentation/auth/presentation/registration_screen.dart';
import 'package:assessili_assement_app/presentation/auth/presentation/widgets/phone_inputfield.dart';
import 'package:assessili_assement_app/presentation/base_widgets/base_button.dart';
import 'package:assessili_assement_app/presentation/base_widgets/rounded_corner_container.dart';
import 'package:assessili_assement_app/presentation/base_widgets/text_field.dart';
import 'package:assessili_assement_app/constants/assets_paths.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final authController = Get.put(AuthController());
  final _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradiantContainer(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: SingleChildScrollView(
            child: Form(
              key: _fromKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Image.asset(
                    authController.isPhoneSelected.value
                        ? AppAssets.phoneLogin
                        : AppAssets.gmailLogin,
                    height: 250.h,
                    width: 200.w,
                  ), // Illustration
                  const SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(15.sp),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 36, 10, 10)),
                      borderRadius: BorderRadius.circular(10.r),
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF464748).withOpacity(0.3),
                          // const Color(0xFF8F7AF6).withOpacity(0.5),
                          const Color(0xFF464748).withOpacity(0.3),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Login to Your Account',
                          style:
                              TextStyle(fontSize: 22.sp, color: Colors.white),
                        ),
                        const SizedBox(height: 20),
                        ToggleEmailPhone(
                          onToggle: authController.toggleSelection,
                        ),
                        const SizedBox(height: 20),
                        Obx(
                          () => authController.isLoginLoading.value
                              ? const Center(
                                  child: CircularProgressIndicator.adaptive())
                              : CustomButton(
                                  onTap: () {
                                    authController.login();
                                  },
                                  buttonText: "Login",
                                  textColor: Colors.white,
                                  backgroundColor: Colors.blue[800],
                                ),
                        ),
                        const SizedBox(height: 20),
                        Text.rich(
                          TextSpan(
                            text: "Don't have an account? ",
                            style: const TextStyle(color: Colors.white),
                            children: [
                              TextSpan(
                                text: 'Create Account',
                                style: const TextStyle(
                                    color: Color(0xFF8F7AF6),
                                    fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const RegistrationScreen()));
                                  },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text.rich(
                          TextSpan(
                            text: "Forgot Your",
                            style: TextStyle(
                                color: Colors.white, fontSize: 18.sp.sp),
                            children: [
                              TextSpan(
                                text: ' Password',
                                style: TextStyle(
                                    color: const Color(0xFF8F7AF6),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                ForgotPasswordScreen(
                                                  isPhoneSelected:
                                                      authController
                                                          .isPhoneSelected
                                                          .value,
                                                )));
                                  },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ToggleEmailPhone extends StatefulWidget {
  final Function(bool) onToggle;
  const ToggleEmailPhone({super.key, required this.onToggle});

  @override
  _ToggleEmailPhoneState createState() => _ToggleEmailPhoneState();
}

class _ToggleEmailPhoneState extends State<ToggleEmailPhone> {
  final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  authController.toggleSelection(false);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: authController.isPhoneSelected.value
                        ? Colors.black
                        : Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Email',
                    style: TextStyle(
                      color: authController.isPhoneSelected.value
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  authController.toggleSelection(true);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: authController.isPhoneSelected.value
                        ? Colors.white
                        : Colors.black,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Phone Number',
                    style: TextStyle(
                      color: authController.isPhoneSelected.value
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          authController.isPhoneSelected.value
              ? PhoneInputfield()
              : emailField(),
        ],
      ),
    );
  }

  Widget emailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'E-mail',
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 10.h),
        CustomTextField(
          controller: authController.loginEmailController.value,
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(color: Colors.white),
          enableBorderColor: Colors.white,
          focusBorderColor: Colors.purple,
          hintText: 'Enter your email',
          border: 10.r,
          validator: (value) {
            if (!GetUtils.isEmail(value)) {
              return "Enter valid Email";
            }
            return null;
          },
          hintStyle: const TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 15.h),
        const Text(
          'Password',
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 10.h),
        Obx(
          () => CustomTextField(
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
          ),
        ),
      ],
    );
  }
}
