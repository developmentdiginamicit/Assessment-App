import 'package:assessili_assement_app/presentation/assistant/presentation/bot_get_strated_screen.dart';
import 'package:assessili_assement_app/presentation/base_widgets/base_button.dart';
import 'package:assessili_assement_app/presentation/base_widgets/rounded_corner_container.dart';
import 'package:assessili_assement_app/constants/assets_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AssistantScreen extends StatefulWidget {
  const AssistantScreen({super.key});

  @override
  State<AssistantScreen> createState() => _AssistantScreenState();
}

class _AssistantScreenState extends State<AssistantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradiantContainer(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.8,
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 30.h),
          alignment: Alignment.topCenter,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppAssets.heroImage), fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Your Personal AI Assistant",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 45.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).highlightColor)),
              Text("Hey Saurabh how can I help you ?",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).highlightColor)),
            ],
          ),
        ),
        CustomButton(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const BotGetStratedScreen()));
          },
          buttonText: "Get Started",
          horizontlPadding: 30.w,
          backgroundColor: Theme.of(context).primaryColor,
        )
      ])),
    );
  }
}
