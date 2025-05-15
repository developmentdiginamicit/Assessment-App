import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:assessili_assement_app/constants/colors.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:assessili_assement_app/constants/assets_paths.dart';
import 'package:assessili_assement_app/presentation/analytics/presentation/analytics_screen.dart';
import 'package:assessili_assement_app/presentation/assessment/presentaion/assessment_screen.dart';
import 'package:assessili_assement_app/presentation/dashboard/screens/dashboard_screen.dart';
import 'package:assessili_assement_app/presentation/feed/presentation/feed_screen.dart';
import '../../../utils/navigation.dart';
import '../../assistant/presentation/bot_landing_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 2;

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final List<Widget> _screens = const [
    DashboardScreen(),
    AssessmentScreen(),
    AssistantScreen(),
    AnalyticsScreen(),
    FeedScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return onWillPop(context);
      }  ,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(
            255, 11, 5, 50), // Background color for the whole app
        body: _screens[selectedIndex], // The selected screen to display
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          iconPadding: 15.sp,
          index: selectedIndex,
          items: [
            buttomWidget(
                icon: AppIcon.dashboardIcon, label: "Dashboard", index: 0),
            buttomWidget(
                icon: AppIcon.assessmentIcon, label: "Assessment", index: 1),
            buttomWidget(
                icon: AppIcon.assistantIcon, label: "Assistant", index: 2),
            buttomWidget(icon: AppIcon.analytics, label: "Analytics", index: 3),
            buttomWidget(icon: AppIcon.feed, label: "Feed", index: 4),
          ],
          color: Colors.black,
          buttonBackgroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            _onItemTapped(index);
          },
          letIndexChange: (index) => true,
        ),
      ),
    );
  }

  CurvedNavigationBarItem buttomWidget({
    required String icon,
    required String label,
    required int index,
  }) {
    return CurvedNavigationBarItem(
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              colors: selectedIndex != index
                  ? [AppColors.whiteColor, AppColors.whiteColor]
                  : [
                      AppColors.primaryColor,
                      AppColors.navColor
                    ], // Define your gradient colors here
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds);
          },
          blendMode: BlendMode.srcIn,
          child: Image.asset(
            icon,
            height: 25.h,
            width: 25.w,
          ),
        ),
        label: label,
        labelStyle: TextStyle(
            color: selectedIndex == index
                ? AppColors.navColor
                : AppColors.whiteColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400));
  }
}
