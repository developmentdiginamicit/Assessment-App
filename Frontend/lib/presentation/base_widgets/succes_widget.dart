import 'package:assessili_assement_app/presentation/base_widgets/rounded_corner_container.dart';
import 'package:assessili_assement_app/presentation/home/presentation/home_screen.dart';
import 'package:assessili_assement_app/constants/assets_paths.dart';
import 'package:assessili_assement_app/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccesWidget extends StatefulWidget {
  SuccesWidget({super.key, this.title});

  String? title;

  @override
  State<SuccesWidget> createState() => _SuccesWidgetState();
}

class _SuccesWidgetState extends State<SuccesWidget> {
  @override
  void initState() {
    super.initState();

    // Navigate to next screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      navigatePushRemoveUntil(context, HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradiantContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.successImage,
              height: 128.h,
              width: 128.w,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              widget.title ?? "",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
            SizedBox(
              height: 10.h,
            ),
            const Text(
              "You will be redirected to the main page\n                  in a few moments",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
