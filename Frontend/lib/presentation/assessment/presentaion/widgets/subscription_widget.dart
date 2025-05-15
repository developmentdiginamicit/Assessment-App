import 'package:assessili_assement_app/presentation/base_widgets/app_bar_widget.dart';
import 'package:assessili_assement_app/presentation/base_widgets/base_button.dart';
import 'package:assessili_assement_app/presentation/base_widgets/rounded_corner_container.dart';
import 'package:assessili_assement_app/constants/assets_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  bool isSelected = false; // Track the radio button state

  void toggleRadio(bool? value) {
    setState(() {
      isSelected = value ?? false; // Toggle the state
    });
  }

  List<String> title = [
    "Everything in Basic plan",
    "Access to OpenAI o1-preview, OpenAI ",
    "Access to GPT-4o, GPT-4o mini, GPT-4",
    "Access to Advanced Voice Mode",
    "Create and use custom GPTs",
    "Unlimited private projects"
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithProfile(),
      body: GradiantContainer(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Subscription Plans",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            top: 16.h, bottom: 20.h, left: 15.w, right: 15.w),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppAssets.bigContaner),
                              fit: BoxFit.fill),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Transform.scale(
                                  scale: 1.5,
                                  child: Radio<bool>(
                                    value: true,
                                    groupValue: isSelected,
                                    onChanged: toggleRadio,
                                    activeColor: Colors.white,
                                    // hoverColor: Colors.white,
                                    // overlayColor: WidgetStatePropertyAll(Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                const Text(
                                  "Pro",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                CustomButton(
                                  buttonText: "SAVE 12%",
                                  fontSize: 12,
                                  textColor: Colors.white,
                                  width: 100.w,
                                )
                              ],
                            ),
                            SizedBox(height: 10.h),
                            const Text(
                              "7 days free, then \$35.95/mo",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            const Text(
                              "\$8/mo",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            const Text(
                              "when billed annually",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: title.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.check,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Text(
                                          title[index],
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomButton(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            const SubscriptionScreen()));
                              },
                              buttonText: 'Subscribe Now',
                              textColor: Colors.white,
                              backgroundColor: Colors.deepPurpleAccent,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
