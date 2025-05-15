import 'package:assessili_assement_app/presentation/feed/presentation/feed_blog.dart';
import 'package:assessili_assement_app/presentation/feed/presentation/widget/video_blog_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrendingTab extends StatelessWidget {
  const TrendingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FeedBlogScreen()));
                },
                child: const VideoBlogCardWidget()),
          );
        },
        separatorBuilder: (context, index) => Container(
              margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
              height: 1.h,
              color: Colors.grey,
            ),
        itemCount: 10);
  }
}
