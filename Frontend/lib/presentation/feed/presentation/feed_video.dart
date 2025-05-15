import 'package:assessili_assement_app/presentation/base_widgets/app_bar_widget.dart';
import 'package:assessili_assement_app/presentation/base_widgets/rounded_corner_container.dart';
import 'package:assessili_assement_app/presentation/feed/presentation/widget/video_blog_card.dart';
import 'package:assessili_assement_app/constants/assets_paths.dart';
import 'package:assessili_assement_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../base_widgets/contaner_with_gradian_border.dart';
import '../../base_widgets/customIcon_button.dart';

class FeedVideoScreen extends StatefulWidget {
  const FeedVideoScreen({super.key});

  @override
  State<FeedVideoScreen> createState() => _FeedVideoScreenState();
}

class _FeedVideoScreenState extends State<FeedVideoScreen> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithProfile(),
      body: GradiantContainer(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 5.h),
        child: SingleChildScrollView(
          controller: scrollController,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ContainerWithGradientBorder(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 235.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/banner.png"),
                      fit: BoxFit.cover, // Change to cover if needed
                    ),
                  ),
                  child: Center(
                    child: Image.asset(
                      AppAssets.playButton,
                      height: 30.h,
                      width: 30.w,
                      // Change fit according to your needs
                    ),
                  ),
                ),
              ),
            ),
            Row(children: [
              CustomiconButton(
                icon: Icons.thumb_up_off_alt,
                size: 20.sp,
                onPressed: () {},
              ),
              CustomiconButton(
                icon: Icons.thumb_down_off_alt,
                size: 20.sp,
                onPressed: () {},
              ),
              CustomiconButton(
                icon: Icons.share,
                size: 20.sp,
                onPressed: () {},
              ),
            ]),
            Text("VCE Chemistry Unit 3 Headstart Lecture",
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.whiteColor)),
            SizedBox(height: 10.h),
            Text(
                "484 views  29 Jan 2024All the content you need to revise to get a headstart on VCE Chemistry Units 3&4, delivered by an expert presenter. Organic chemistry is the study of the structure, properties, composition, reactions, and preparation of carbon-containing compounds. Most organic compounds contain carbon and hydrogen, but they may also include any number of other elements (e.g., nitrogen, oxygen, halogens, phosphorus, silicon, sulfur).Access the slides: https://atarnotes.me/3WOhxf9  Sign up for tonnes of free resources and to stay up to date: https://atarnotes.me/3JpjefL Want more help? ATAR Notes publishes amazing Course Notes & Topic Tests for VCE Chemistry 3&4. You can find these at: https://atarnotes.me/3DnzMkB We also offer amazing online tutoring at https://atarnotes.me/3Dpv6uF ",
                style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.whiteColor)),
            SizedBox(height: 20.h),
            Text("Top Feeds",
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.whiteColor)),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.h),
              height: 1.h,
              color: Colors.grey,
            ),
            ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                controller: scrollController,
                itemBuilder: (context, index) {
                  return const VideoBlogCardWidget();
                },
                separatorBuilder: (context, index) => Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.h, vertical: 10.h),
                      height: 1.h,
                      color: Colors.grey,
                    ),
                itemCount: 10)
          ]),
        ),
      )),
    );
  }
}
