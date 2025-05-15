import 'package:assessili_assement_app/presentation/base_widgets/app_bar_widget.dart';
import 'package:assessili_assement_app/presentation/base_widgets/rounded_corner_container.dart';
import 'package:assessili_assement_app/constants/assets_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/colors.dart';

class FeedBlogScreen extends StatefulWidget {
  const FeedBlogScreen({super.key});

  @override
  State<FeedBlogScreen> createState() => _FeedBlogScreenState();
}

class _FeedBlogScreenState extends State<FeedBlogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithProfile(),
      body: GradiantContainer(
          child: Padding(
        padding: EdgeInsets.all(10.0.sp),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset(AppAssets.chatPgt),
                SizedBox(width: 10.w),
                Text("GPT- 4.0 Blogs",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.whiteColor)),
              ]),
              SizedBox(height: 20.h),
              Text("October 1, 2024",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.whiteColor)),
              SizedBox(height: 5.h),
              Text("Introducing the Realtime API",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.whiteColor)),
              Text(
                  "Developers can now build fast speech-to-speech experiences into their applications",
                  style: TextStyle(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.whiteColor)),
              Padding(
                padding: EdgeInsets.only(top: 20.0.h, bottom: 16.h),
                child: Image.asset(
                  "assets/images/image 29.png",
                  width: 355.w,
                  height: 131.h,
                ),
              ),
              Text(
                  "Update on October 17, 2024: Audio inputs and outputs are now available in the Chat Completions API. Get started here⁠(opens in a new window).Today, we're introducing a public beta of the Realtime API, enabling all paid developers to build low-latency, multimodal experiences in their apps. Similar to ChatGPT’s Advanced Voice Mode, the Realtime API supports natural speech-to-speech conversations using the six preset voices⁠(opens in a new window) already supported in the API.We’re also introducing audio input and output in the Chat Completins API⁠(opens in a new window) to support use cases that don’t require the low-latency benefits of the Realtime API. With this update, developers can pass any text or audio inputs into GPT-4o⁠ and have the model respond with their choice of text, audio, or both.Previously, to create a similar voice assistant experience, developers had to transcribe audio with an automatic speech recognition model like Whisper⁠, pass the text to a text model for inference or reasoning, and then play the model’s output using a text-to-speech⁠(opens in a new window) model. This approach often resulted in loss of emotion, emphasis and accents, plus noticeable latency. With the Chat Completions API, developers can handle the entire process with a single API call, though it remains slower than human conversation. The Realtime API improves this by streaming audio inputs and outputs directly, enabling more natural conversational experiences. It can also handle interruptions automatically, much like Advanced Voice Mode in ChatGPT.Under the hood, the Realtime API lets you create a persistent WebSocket connection to exchange messages with GPT-4o. The API supports function calling⁠(opens in a new window), which makes it possible for voice assistants to respond to user requests by triggering actions or pulling in new context. For example, a voice assistant could place an order on behalf of the user or retrieve relevant customer information to personalize its responses.Powering customer support agents, language learning assistants, and moreAs part of our iterative deployment strategy, we’ve been testing the Realtime API with a handful of partners to gather feedback while we build. A couple of promising early use cases include:Healthify, a nutrition and fitness coaching app, uses the Realtime API to enable natural conversations with its AI coach Ria, while involving human dietitians when needed for personalized support.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.whiteColor)),
                      SizedBox(height: 20.h),
               Text("How it works",
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.whiteColor))
            ],
          ),
        ),
      )),
    );
  }
}
