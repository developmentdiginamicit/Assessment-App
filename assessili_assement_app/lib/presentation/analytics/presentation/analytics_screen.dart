import 'package:assessili_assement_app/presentation/analytics/controller/analaytics_controller.dart';
import 'package:assessili_assement_app/presentation/analytics/widget/topic_widget.dart';
import 'package:assessili_assement_app/presentation/analytics/widget/trait_widget.dart';
import 'package:assessili_assement_app/presentation/base_widgets/app_bar_widget.dart';
import 'package:assessili_assement_app/presentation/base_widgets/base_button.dart';
import 'package:assessili_assement_app/presentation/base_widgets/rounded_corner_container.dart';
import 'package:assessili_assement_app/constants/assets_paths.dart';
import 'package:assessili_assement_app/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen>
    with SingleTickerProviderStateMixin {
  final analyticsController = Get.put(AnalyticsController());
  late TabController _tabController;

  final List<Map<String, String>> items = [
    {
      'image': 'assets/images/image 23.png',
      'title': 'Improve Time Management:',
      'subtitle':
          'Develop effective time management skills to allocate appropriate time for studying, completing assignments, and reviewing material',
    },
    {
      'image': 'assets/images/image 10.png',
      'title': 'Enhance Critical Thinking',
      'subtitle':
          'Practice critical thinking skills through problem-solving activities, analyzing information from multiple perspectives, and engaging in discussions',
    },
    {
      'image': 'assets/images/image 11.png',
      'title': 'Develop Self-Motivation',
      'subtitle':
          ' Cultivate intrinsic motivation by setting personal goals, finding relevance in the subjects studied, and celebrating progress and achievements.',
    },
    {
      'image': 'assets/images/image 12.png',
      'title': 'Develop Self-Motivation',
      'subtitle':
          ' Cultivate intrinsic motivation by setting personal goals, finding relevance in the subjects studied, and celebrating progress and achievements.',
    },
    {
      'image': 'assets/images/image 23.png',
      'title': 'Develop Self-Motivation',
      'subtitle':
          ' Cultivate intrinsic motivation by setting personal goals, finding relevance in the subjects studied, and celebrating progress and achievements.',
    },
  ];
  bool isFirstTabSelected = true;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((v) {
      analyticsController.getBrightTraits();
      analyticsController.getDarkTraits();
    });
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithProfile(),
      body: GradiantContainer(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Assessment Analysis",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                  padding: EdgeInsets.all(15.sp),
                  decoration: const BoxDecoration(
                    // borderRadius: BorderRadius.circular(20.sp),
                    image: DecorationImage(
                        image: AssetImage(AppAssets.popupBackground),
                        fit: BoxFit.fill),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            AppAssets.circleC3,
                            fit: BoxFit.cover,
                            height: 50.h,
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Expanded(
                              child: CustomButton(
                                  onTap: () => _recomandationDialog(
                                        context: context,
                                        items: items,
                                      ),
                                  buttonText: "View Recommendation"))
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        padding: EdgeInsets.all(15.sp),
                        decoration: const BoxDecoration(
                          // borderRadius: BorderRadius.circular(20.sp),
                          image: DecorationImage(
                              image: AssetImage(AppAssets.smallContainer),
                              fit: BoxFit.fill),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Characteristics",
                              style: textFieldStyle,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "Students in this category have an average performance level, with room for improvement in certain areas of both bright and dark traits. They possess a moderate understanding of concepts but may struggle with consistent concentration, effective study habits, and knowledge gaps. They exhibit an average level of cognitive skills and may display occasional impulsiveness",
                              style: normalTextStyle,
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
              Container(
                height: 50.h,
                margin: EdgeInsets.symmetric(vertical: 15.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage(AppAssets
                        .smallContainer), // Replace with your image path
                    fit: BoxFit.fill,
                  ),
                ),
                child: Row(
                  children: [
                    // First Toggle Container
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isFirstTabSelected = true;
                          });
                        },
                        child: Stack(
                          children: [
                            // Background image for Tab 1 only when selected
                            if (isFirstTabSelected)
                              Container(
                                decoration: const BoxDecoration(
                                  //
                                  image: DecorationImage(
                                    image: AssetImage(AppAssets
                                        .tabContainer), // Image for selected tab 1
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            // Text overlay for Tab 1
                            const Center(
                              child: Text(
                                'Trait',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Second Toggle Container
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isFirstTabSelected = false;
                          });
                        },
                        child: Stack(
                          children: [
                            // Background image for Tab 2 only when selected
                            if (!isFirstTabSelected)
                              Container(
                                decoration: const BoxDecoration(
                                  //
                                  image: DecorationImage(
                                    image: AssetImage(AppAssets
                                        .tabContainer), // Image for selected tab 2
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            // Text overlay for Tab 2
                            const Center(
                              child: Text(
                                'Topic',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              isFirstTabSelected ? TraitWidget() : const TopicWidget()
            ],
          ),
        ),
      )),
    );
  }

  void _recomandationDialog(
      {required BuildContext context,
      required List<Map<String, String>> items}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // Rounded corners
          ),
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppAssets.bigContaner), fit: BoxFit.fill),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 12,
                        child: Center(
                          child: Icon(
                            Icons.close,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Our Recommendations:",
                    style: textFieldStyle,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Leading image
                            Image.asset(
                              items[index]['image']!,
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 10.w),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "",
                                    style: normalTextStyle,
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
