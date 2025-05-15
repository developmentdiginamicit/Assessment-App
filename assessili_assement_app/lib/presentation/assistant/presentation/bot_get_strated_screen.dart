import 'package:assessili_assement_app/presentation/assessment/presentaion/widgets/category_card.dart';
import 'package:assessili_assement_app/presentation/assistant/presentation/quick_quiz_screen.dart';
import 'package:assessili_assement_app/presentation/base_widgets/app_bar_widget.dart';
import 'package:assessili_assement_app/presentation/base_widgets/base_button.dart';
import 'package:assessili_assement_app/presentation/base_widgets/rounded_corner_container.dart';
import 'package:assessili_assement_app/presentation/base_widgets/text_field.dart';
import 'package:assessili_assement_app/constants/assets_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'chat_screen.dart';

class BotGetStratedScreen extends StatelessWidget {
  const BotGetStratedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithProfile(),
      body: GradiantContainer(
          child: Padding(
        padding: EdgeInsets.all(18.0.sp),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Ask me any thing you want ...",
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white)),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage(
                            AppAssets.smallContanerAssist,
                          ),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(children: [
                      Image.asset(
                        AppAssets.randomImage,
                        height: 118.h,
                        width: 99,
                      ),
                      Text("Uncover new  thing via Voice chats",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white)),
                      SizedBox(height: 10.h),
                      CustomButton(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const QuickQuizScreen()));
                          },
                          buttonText: "Let's Talk")
                    ]),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10.h),
                          padding: EdgeInsets.all(15.sp),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage(AppAssets.smallContanerAssist),
                                fit: BoxFit.fill),
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.chat_rounded,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 10.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Start a\nNew Chat",
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white)),
                                    const Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    )
                                  ],
                                )
                              ]),
                        ),
                        Container(
                          padding: EdgeInsets.all(15.sp),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage(AppAssets.smallContanerAssist),
                                fit: BoxFit.fill),
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.image,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 10.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Search by\nImage",
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white)),
                                    const Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    )
                                  ],
                                )
                              ]),
                        ),
                      ]),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Text("People also search for.",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white)),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QuickQuizScreen()));
              },
              child: CategoryCardWidget(
                  index: 0,
                  leadingIcon: AppAssets.fileDoc,
                  fontSize: 13.sp,
                  tralingICon: Icons.arrow_forward,
                  leadinColor: Colors.purple,
                  title:
                      'Can you recomended me something how can I improve my Chemistry.', subject: '',),
            ),
            InkWell(
              onTap: () {},
              child: CategoryCardWidget(
                  index: 0,
                  leadingIcon: AppAssets.fileDoc,
                  fontSize: 13.sp,
                  tralingICon: Icons.arrow_forward,
                  leadinColor: Colors.green,
                  title: 'Can you provide me  a personalised Study plan ?'),
            ),
            CategoryCardWidget(
                index: 0,
                leadingIcon: AppAssets.fileDoc,
                fontSize: 13.sp,
                tralingICon: Icons.arrow_forward,
                leadinColor: Colors.yellow,
                title:
                    'Provide me some suggestions according to my assessment report.'),
            SizedBox(height: 30.h),
            CustomTextField(
              border: 20.r,
              hintText: "Ask Me Anything ...",
              focusColor: Colors.white,
              cursorColor: Colors.white,
              disableBorderColor: Colors.white,
              hintStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 15.sp),
              fillColor: Color.lerp(
                  const Color(0x00ffffff), const Color(0xc4ffffff), 0.1),
              sufixIcon: SizedBox(
                width: 100.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.image,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ChatScreen(
                                        title: 'Pandeu',
                                      )));
                        },
                        icon: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
            )
          ]),
        ),
      )),
    );
  }
}
