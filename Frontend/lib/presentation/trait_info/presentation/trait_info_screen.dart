import 'package:assessili_assement_app/presentation/base_widgets/custom_appbar.dart';
import 'package:assessili_assement_app/presentation/base_widgets/rounded_corner_container.dart';
import 'package:assessili_assement_app/presentation/trait_info/controller/trait_info_controller.dart';
import 'package:assessili_assement_app/presentation/trait_info/presentation/widget/train_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../base_widgets/custom_popup_menu_button.dart';

class TraitInfoScreen extends StatefulWidget {
  const TraitInfoScreen({super.key});

  @override
  State<TraitInfoScreen> createState() => _TraitInfoScreenState();
}

class _TraitInfoScreenState extends State<TraitInfoScreen> {
  final traitInfoController = Get.put(TraitInfoController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((v) {
      traitInfoController.getTraitInfo();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradiantContainer(
          child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
        child: SafeArea(
          child: Column(
            children: [
              const CustomAppbar(),
              SizedBox(
                height: 30.h,
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Trait Info",
                        style: TextStyle(
                          fontSize: 25.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        )),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.all(7.sp),
                            decoration: BoxDecoration(
                                color: const Color(0xFF603DC8),
                                borderRadius: BorderRadius.circular(5.r)),
                            child: Obx(() => Row(
                                  children: [
                                    Text(
                                        traitInfoController.selectedTrait.value,
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                        )),
                                    CustomMenuButton(
                                      options: const [
                                        "Bright Trait",
                                        "Dark Trait"
                                      ],
                                      onSelected: (String value) {
                                      

                                      traitInfoController.changeTrait(value);
                                      },
                                    )
                                  ],
                                )),
                          ),
                        ])
                  ]),
              SizedBox(height: 30.h),
              Obx(
                () => traitInfoController.isLoading.value
                    ? const Center(child: CircularProgressIndicator.adaptive())
                    : Expanded(
                        child: ListView.builder(
                          itemCount: traitInfoController.selectedTrait.value ==
                                  "Bright Trait"
                              ? traitInfoController.brightTraitList.length
                              : traitInfoController.darkTraitList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            if (traitInfoController.selectedTrait.value ==
                                "Bright Trait") {
                              return TraitInfoCardWidget(
                                  title: traitInfoController
                                      .brightTraitList[index].title,
                                  description: traitInfoController
                                      .brightTraitList[index].example,
                                  factorsAffectingTrait: traitInfoController
                                          .brightTraitList[index]
                                          .factorsAffectingTrait ??
                                      []);
                            } else {
                              return TraitInfoCardWidget(
                                  title: traitInfoController
                                      .darkTraitList[index].title,
                                  description: traitInfoController
                                      .darkTraitList[index].example,
                                  factorsAffectingTrait: traitInfoController
                                          .darkTraitList[index]
                                          .factorsAffectingTrait ??
                                      []);
                            }
                          },
                        ),
                      ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
