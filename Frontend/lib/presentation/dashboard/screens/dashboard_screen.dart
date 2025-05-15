import 'package:assessili_assement_app/presentation/base_widgets/app_bar_widget.dart';
import 'package:assessili_assement_app/presentation/base_widgets/base_button.dart';
import 'package:assessili_assement_app/presentation/base_widgets/rounded_corner_container.dart';
import 'package:assessili_assement_app/presentation/trait_info/presentation/trait_info_screen.dart';
import 'package:assessili_assement_app/constants/assets_paths.dart';
import 'package:assessili_assement_app/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithProfile(
        title: "Wilcome,Sourav",
      ),
      body: GradiantContainer(
          child: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(children: [
                  Container(
                      padding: EdgeInsets.all(15.sp),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppAssets.ractangle),
                            fit: BoxFit.fill),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name : Sourabh", style: normalTextStyle),
                          Text(
                            "Grade: 10th",
                            style: normalTextStyle,
                          ),
                          Text(
                            "Age:15",
                            style: normalTextStyle,
                          ),
                          Text(
                            "Strengh:  Mathematics, Critical Thinking, and Problem SolvingInterests: Loves coding, particularly working with JavaScript and Python. Enjoys robotics and often participates in science fairs and coding hackathons.Extracurricular",
                            style: normalTextStyle,
                          ),
                          Text(
                            "Interest : akjdfhakjdhf jkhakjdfh akjhdfkjla djfh akjdhfjkahdl fkhajkdhfjka dhfkjhlkjahd fjkahdjkfha kjhdfjkalh dhfljkahdfkl ahdkjfh ajkl hkjdfh kaldhfka dfhakjhldfljakdhflja dhf",
                            style: normalTextStyle,
                          ),
                          Text(
                            "Extracurricular Activity : akjdfhakjdhf jkhakjdfh akjhdfkjla djfh akjdhfjkahdl fkhajkdhfjka dhfkjhlkjahd fjkahdjkfha kjhdfjkalh dhfljkahdfkl ahdkjfh ajkl hkjdfh kaldhfka dfhakjhldfljakdhflja dhf",
                            style: normalTextStyle,
                          ),
                          Text(
                            "Future Goals: akjdfhakjdhf jkhakjdfh akjhdfkjla djfh akjdhfjkahdl fkhajkdhfjka dhfkjhlkjahd fjkahdjkfha kjhdfjkalh dhfljkahdfkl ahdkjfh ajkl hkjdfh kaldhfka dfhakjhldfljakdhflja dhf",
                            style: normalTextStyle,
                          ),
                        ],
                      )),
                  SizedBox(height: 11.h),
                  Row(children: [
                    const Text(
                      "Trait wise analysis",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(width: 10.w),
                    const Expanded(
                      child: CustomButton(
                        leftIcon: AppAssets.infoIcon,
                        buttonText: "Select",
                        textColor: Colors.white,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: CustomButton(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const TraitInfoScreen()));
                        },
                        leftIcon: AppAssets.infoIcon,
                        buttonText: "Trait",
                        textColor: Colors.white,
                        isBorder: true,
                        borderWidth: 1.w,
                        backgroundColor: Colors.transparent,
                        borderColor: Colors.white,
                        radius: 10.r,
                      ),
                    )
                  ]),
                  SizedBox(height: 20.h),
                  ListView.builder(
                    controller: scrollController,
                    itemCount: 15,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 30.h),
                        child: index % 2 != 0
                            ? Image.asset(AppAssets.graph1)
                            : Image.asset(AppAssets.graph),
                      );
                    },
                  )
                ]),
              ),
            )
          ],
        ),
      )),
    );
  }
}
