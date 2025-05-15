import 'package:assessili_assement_app/presentation/analytics/controller/analaytics_controller.dart';
import 'package:assessili_assement_app/presentation/analytics/widget/bar_chat.dart';
import 'package:assessili_assement_app/presentation/trait_info/presentation/trait_info_screen.dart';
import 'package:assessili_assement_app/constants/assets_paths.dart';
import 'package:assessili_assement_app/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../base_widgets/custom_popup_menu_button.dart';

class TraitWidget extends StatefulWidget {
  const TraitWidget({super.key});

  @override
  State<TraitWidget> createState() => _TraitWidgetState();
}

class _TraitWidgetState extends State<TraitWidget> {
  final scrollController = ScrollController();
  final analyticsController = Get.put(AnalyticsController());

  final ValueNotifier<String> selectedTrait =
      ValueNotifier<String>("Bright Traits");

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((v) {
      if (analyticsController.selectedTrait.contains("Bright Trait")) {
        analyticsController.getBrightTraits();
      } else {
        analyticsController.getDarkTraits();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => analyticsController.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Table(
                    border: const TableBorder(
                      top: BorderSide(color: Colors.white, width: 2),
                      bottom: BorderSide(color: Colors.white, width: 2),
                      left: BorderSide(color: Colors.white, width: 2),
                      right: BorderSide(color: Colors.white, width: 2),
                      horizontalInside:
                          BorderSide(color: Colors.white, width: 1),
                      verticalInside: BorderSide(color: Colors.white, width: 1),
                    ),
                    children: [
                      // Headers
                      TableRow(
                        children: [
                          Obx(() => Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    analyticsController.selectedTrait.value,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  CustomMenuButton(
                                    options: const [
                                      "Bright Trait",
                                      "Dark Trait"
                                    ],
                                    onSelected: (String value) {
                                      analyticsController.selectedTrait.value =
                                          value;
                                      if (analyticsController.selectedTrait
                                          .contains("Bright Trait")) {
                                        analyticsController.getBrightTraits();
                                      } else {
                                        analyticsController.getDarkTraits();
                                      }
                                    },
                                  )
                                ],
                              )),
                          _buildCell(
                              text: 'You',
                              color: Theme.of(context).primaryColor),
                        ],
                      ),

                      ...analyticsController.rows.map(
                        (row) => TableRow(
                          children: [
                            _buildCell(
                                text: row['text'].toString().toUpperCase(),
                                color: row['color']),
                            _buildCell(
                                text: row['score'].toString(),
                                color: Colors.black),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Row(children: [
                  const Text(
                    "Trait wise analysis",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  SizedBox(width: 20.w),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.sp, vertical: 6.h),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Row(children: [
                      Image.asset(
                        AppAssets.infoIcon,
                        height: 20.h,
                        width: 20.w,
                      ),
                      SizedBox(width: 5.w),
                      Text("select",
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.sp))
                    ]),
                  ),
                  SizedBox(width: 10.w),
                  InkWell(
                    onTap: () {
                      navigation(context, const TraitInfoScreen());
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.sp, vertical: 6.h),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Row(children: [
                        Image.asset(
                          AppAssets.infoIcon,
                          height: 20.h,
                          width: 20.w,
                        ),
                        SizedBox(width: 5.w),
                        Text("Trait",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.sp))
                      ]),
                    ),
                  ),
                ]),
                SizedBox(height: 20.h),
                Column(
                    children: analyticsController.rows
                        .map((row) => Container(
                              height: 450.h,
                              width: double.infinity,
                              margin: EdgeInsets.only(bottom: 30.h),
                              child: TraitScoreCard(
                                  title: row['text'].toString(),
                                  desc: row['data'].recommendations.statement ??
                                      "",
                                  score: double.parse(
                                      row['score'].toString() ?? "0.0"),
                                  averageScore: double.parse(
                                      row['data'].averageScore ?? 0.0),
                                  idealScore: double.parse(
                                      row['data'].idealScore ?? 0.0),
                                  maximumScore: double.parse(
                                      row['data'].maximumScore ?? 0.0)),
                              // child: index % 2 != 0
                              //     ? Image.asset(AppAssets.graph1)
                              //     : Image.asset(AppAssets.graph),
                            ))
                        .toList()),
                // ListView.builder(
                //   controller: scrollController,
                //   itemCount: 15,
                //   shrinkWrap: true,
                //   itemBuilder: (context, index) {
                //     return Container(
                //       height: 450.h,
                //       width: double.infinity,
                //       margin: EdgeInsets.only(bottom: 30.h),
                //       child: TraitScoreCard(),
                //       // child: index % 2 != 0
                //       //     ? Image.asset(AppAssets.graph1)
                //       //     : Image.asset(AppAssets.graph),
                //     );
                //   },
                // )
              ],
            ),
    );
  }

  Widget _buildCell({required String text, required Color color}) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: color,
      child: Center(
        child: Text(
          maxLines: 1,
          text,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // Widget _buildLegendItem(String text, Color color) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 8.0),
  //     child: Row(
  //       children: [
  //         Container(
  //           width: 16,
  //           height: 16,
  //           decoration: BoxDecoration(
  //             color: color,
  //             shape: BoxShape.circle,
  //           ),
  //         ),
  //         const SizedBox(width: 8),
  //         Text(
  //           text,
  //           style: const TextStyle(fontSize: 14, color: Colors.black),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildDropdownCell() {
  //   return Container(
  //     padding: const EdgeInsets.all(8.0),
  //     color: Colors.blue,
  //     child: ValueListenableBuilder<String>(
  //       valueListenable: selectedTrait,
  //       builder: (context, value, child) {
  //         return DropdownButton<String>(
  //           value: value,
  //           dropdownColor: Colors.blue,
  //           items: const [
  //             DropdownMenuItem(
  //               value: "Bright Traits",
  //               child: Text(
  //                 "Bright Traits",
  //                 style: const TextStyle(color: Colors.white),
  //               ),
  //             ),
  //             DropdownMenuItem(
  //               value: "Dark Traits",
  //               child: Text(
  //                 "Dark Traits",
  //                 style: const TextStyle(color: Colors.white),
  //               ),
  //             ),
  //           ],
  //           onChanged: (newValue) {
  //             if (newValue != null) {
  //               selectedTrait.value = newValue;
  //             }
  //           },
  //           underline: const SizedBox.shrink(),
  //         );
  //       },
  //     ),
  //   );
  // }

  // Widget _buildCell(String text, Color color) {
  //   return Container(
  //     padding: const EdgeInsets.all(16.0),
  //     color: color,
  //     child: Center(
  //       child: Text(
  //         text,
  //         maxLines: 1,
  //         style:
  //             const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildCellWithPopupMenu(
    BuildContext context, {
    required String title,
    required List<String> options,
  }) {
    return Container(
      alignment: Alignment.center,
      child: PopupMenuButton<String>(
        onSelected: (String value) {
          print("Selected: $value");
        },
        itemBuilder: (BuildContext context) {
          return options.map((String option) {
            return PopupMenuItem<String>(
              padding: const EdgeInsets.only(top: 20),
              value: option,
              child: Text(option),
            );
          }).toList();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.blue),
            ),
            const Icon(Icons.arrow_drop_down, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}
