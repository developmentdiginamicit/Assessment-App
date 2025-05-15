import 'package:assessili_assement_app/domain/analytics/analytics.dart';
import 'package:assessili_assement_app/presentation/base_widgets/toast_widget.dart';
import 'package:assessili_assement_app/presentation/trait_info/model/trait_info_model.dart';
import 'package:get/get.dart';

class TraitInfoController extends GetxController {
  final analyticRepo = AnalyticsRepo();
  RxBool isLoading = false.obs;
  RxList<BrightTrait> brightTraitList = <BrightTrait>[].obs;
  RxList<DarkTrait> darkTraitList = <DarkTrait>[].obs;

  RxString selectedTrait = "Bright Trait".obs;

  void changeTrait(String value) {
    isLoading(true);
    selectedTrait.value = value;
    isLoading(false);
  }

  /// get assessment list
  Future<void> getTraitInfo() async {
    try {
      isLoading(true);
      var res = await analyticRepo.getTraitInfo();
      if (res.data != null && res.data?.status == true) {
        brightTraitList.clear();
        darkTraitList.clear();
        if (res.data?.data != null) {
          for (int i = 0; i < res.data!.data!.length; i++) {
            brightTraitList
                .addAll(res.data?.data?[i].traitInfo?.brightTrait ?? []);
            darkTraitList.addAll(res.data?.data?[i].traitInfo?.darkTrait ?? []);
          }
        }
      } else {
        isLoading(false);
        TostWidget()
            .successToast(title: "Success!", message: "Something went wrong");
      }
    } finally {
      isLoading(false);
    }
  }
}
