import 'package:assessili_assement_app/data/local_storage.dart';
import 'package:assessili_assement_app/presentation/auth/presentation/login_screen.dart';
import 'package:assessili_assement_app/presentation/auth/presentation/registration_screen.dart';
import 'package:assessili_assement_app/presentation/base_widgets/base_button.dart';
import 'package:assessili_assement_app/presentation/base_widgets/rounded_corner_container.dart';
import 'package:assessili_assement_app/constants/assets_paths.dart';
import 'package:assessili_assement_app/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../home/presentation/home_screen.dart';

class Getstarted extends StatelessWidget {
  const Getstarted({super.key});

  void _navigateToHome() {
    var token = LocalStorage().getToken();

    if (token.isNotEmpty) {
      navigatePushRemoveUntil(Get.context!, HomeScreen());
    } else {
      navigatePushRemoveUntil(Get.context!, const LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradiantContainer(
        child: Padding(
          padding: EdgeInsets.all(25.0.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset(AppAssets.appLogo, width: 200.w, height: 180.h),
              const Spacer(),
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  children: [
                    TextSpan(
                        text: "Welcome to the ",
                        style: TextStyle(
                            fontSize: 35.sp,
                            color: Theme.of(context).highlightColor,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: "assessli ",
                        style: TextStyle(
                            fontSize: 35.sp,
                            color: const Color(0xFF8F7AF6),
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: "App ",
                        style: TextStyle(
                            fontSize: 35.sp,
                            color: Theme.of(context).highlightColor,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: "Assignment ",
                        style: TextStyle(
                            fontSize: 35.sp,
                            color: const Color(0xFF8F7AF6),
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: "is our priority.",
                        style: TextStyle(
                            fontSize: 35.sp,
                            color: Theme.of(context).highlightColor,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const Spacer(),
              CustomButton(
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (_) => const LoginScreen()));
                    navigatePushRemoveUntil(
                        context, const RegistrationScreen());
                  },
                  buttonText: "Get Started",
                  backgroundColor: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).highlightColor),
              SizedBox(height: 20.h),
              CustomButton(
                onTap: () {
                  _navigateToHome();
                },
                buttonText: "I'm already a member",
                backgroundColor: Colors.transparent,
                isBorder: true,
                borderColor: Colors.white,
                textColor: Theme.of(context).highlightColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
