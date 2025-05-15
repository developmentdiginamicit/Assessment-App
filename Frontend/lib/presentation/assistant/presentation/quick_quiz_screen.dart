import 'package:assessili_assement_app/presentation/assistant/presentation/widgets/success_widget.dart';
import 'package:assessili_assement_app/presentation/base_widgets/app_bar_widget.dart';
import 'package:assessili_assement_app/presentation/base_widgets/base_button.dart';
import 'package:assessili_assement_app/presentation/base_widgets/contaner_with_gradian_border.dart';
import 'package:assessili_assement_app/presentation/base_widgets/rounded_corner_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuickQuizScreen extends StatefulWidget {
  const QuickQuizScreen({super.key});

  @override
  State<QuickQuizScreen> createState() => _QuickQuizScreenState();
}

class _QuickQuizScreenState extends State<QuickQuizScreen> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithProfile(),
      body: GradiantContainer(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          ContainerWithGradientBorder(
            // padding: EdgeInsets.all(2.sp),
            // margin: EdgeInsets.only(top: 20.h),
            // decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10.r),
            //     gradient: const LinearGradient(
            //       begin: Alignment.topLeft,
            //       end: Alignment.bottomRight,
            //       colors: [
            //         Color(0xff5e16da),
            //         Color(0xff553de6),
            //         Color(0xff1ef4f2)
            //       ],
            //     )),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 10.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.grey[900]),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10.sp),
                    margin: EdgeInsets.only(bottom: 10.h),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xff5e16da),
                            Color(0xff553de6),
                            Color(0xff1ef4f2)
                          ],
                        )),
                    child: Text("Question 3/5",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                  ),
                  Text("Which one among the following statements is true?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white)),
                  questionBox(
                      onTap: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      },
                      index: 0),
                  questionBox(
                      onTap: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                      index: 1),
                  questionBox(
                      onTap: () {
                        setState(() {
                          selectedIndex = 2;
                        });
                      },
                      index: 2),
                  questionBox(
                      onTap: () {
                        setState(() {
                          selectedIndex = 3;
                        });
                      },
                      index: 3),
                  SizedBox(height: 30.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: ' * ',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: selectedIndex != 1
                                ? 'Your option is correct'
                                : 'Opps! you choose a wrong option.',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          selectedIndex == -1
              ? const SizedBox.shrink()
              : Padding(
                  padding: EdgeInsets.only(top: 30.0.sp),
                  child: CustomButton(
                      onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>const QuizeSuccessWidget()));
                      },
                      buttonText: "Submit"),
                )
        ]),
      )),
    );
  }

  Widget questionBox({required void Function()? onTap, required int index}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(1.sp),
        margin: EdgeInsets.only(top: 15.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                Colors.grey.withOpacity(0.00),
              ]),
        ),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              gradient: LinearGradient(
                  colors: selectedIndex == -1
                      ? [Colors.grey.shade800, Colors.grey.shade800]
                      : selectedIndex == 0
                          ? [Colors.green.shade800, const Color(0xffa5d6a7)]
                          : selectedIndex == 1
                              ? [Colors.red.shade800, Colors.red.shade100]
                              : [
                                  Colors.yellow.shade800,
                                  Colors.yellow.shade300
                                ])),
          child: Text("Mass of an object varies at different places.",
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white)),
        ),
      ),
    );
  }
}
