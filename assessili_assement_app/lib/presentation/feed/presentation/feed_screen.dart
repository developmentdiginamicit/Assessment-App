import 'package:assessili_assement_app/presentation/base_widgets/app_bar_widget.dart';
import 'package:assessili_assement_app/presentation/base_widgets/contaner_with_gradian_border.dart';
import 'package:assessili_assement_app/presentation/base_widgets/rounded_corner_container.dart';
import 'package:assessili_assement_app/presentation/feed/presentation/feed_video.dart';
import 'package:assessili_assement_app/presentation/feed/presentation/widget/tranding.dart';
import 'package:assessili_assement_app/constants/assets_paths.dart';
import 'package:assessili_assement_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widget/news_tab.dart';
import 'widget/popular_tab.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;
  int _currentIndex = 3;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _pageController =
        PageController(initialPage: _currentIndex, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithProfile(
        title: "Sourav",
        leading: null,
      ),
      body: GradiantContainer(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.only(left: 20.0.sp, top: 5.h),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Today Discover",
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.whiteColor)),
            Text("Oct 22, 2024",
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.whiteColor)),
          ]),
        ),
        SizedBox(
          height: 170.h,
          width: double.infinity,
          child: PageView.builder(
            itemCount: 10,
            reverse: false,
            scrollDirection: Axis.horizontal,
            pageSnapping: true,
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        8.0.w), // Adjust horizontal padding to your needs
                child: ContainerWithGradientBorder(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/banner.png"),
                          fit: BoxFit.cover, // Change to cover if needed
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const FeedVideoScreen()));
                        },
                        child: Center(
                          child: Image.asset(
                            AppAssets.playButton,
                            fit: BoxFit
                                .contain, // Change fit according to your needs
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: const Text("Browse By",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: AppColors.whiteColor)),
        ),
        TabBar(
          controller: _tabController,
          indicatorColor: Colors.blue, // Color of the underline cursor
          labelColor: AppColors.whiteColor,
          // Color of the selected tab text

          unselectedLabelColor:
              AppColors.whiteColor, // Color of the unselected tab text
          tabs: const [
            Tab(
              child: Text(
                'Trending',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500), // Change font size here
              ),
            ),
            Tab(
              child: Text(
                'Popular',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500), // Change font size here
              ),
            ),
            Tab(
              child: Text(
                'News',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500), // Change font size here
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [TrendingTab(), PopularTab(), NewsTab()],
          ),
        ),
      ])),
    );
  }
}
