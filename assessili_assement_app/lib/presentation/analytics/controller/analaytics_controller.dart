import 'package:assessili_assement_app/domain/analytics/analytics.dart';
import 'package:assessili_assement_app/presentation/analytics/model/bright_traits.dart';
import 'package:assessili_assement_app/presentation/analytics/model/dark_traits.dart';
import 'package:assessili_assement_app/presentation/analytics/model/topic_model.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';


class AnalyticsController extends GetxController {
  final analyticsRepo = AnalyticsRepo();
  RxBool isLoading = false.obs;

  Rx<BrightTraitsResponse?> brightTraitsResponse =
      Rx<BrightTraitsResponse?>(null);
  Rx<DartTraitResponse?> darktTraitsResponse = Rx<DartTraitResponse?>(null);
   Rx<TopicModel?> topicModel = Rx<TopicModel?>(null);
  var selectedTrait = "Bright Trait".obs;
  RxString htmlContent = "".obs;
  final RxMap<String, List<Map<String, dynamic>>> traitTextMapping =
      <String, List<Map<String, dynamic>>>{
    "Bright Trait": [
      {
        "text": "LOGIC",
        "score": 0,
        "color": Colors.teal,
        'data': LOGIC(),
      },
      {
        "text": "CONCENTRATION",
        "score": 0,
        "color": Colors.teal,
        'data': LOGIC(),
      },
      {
        "text": "COGNITIVE SKILL",
        "score": 0,
        "color": Colors.yellow,
        'data': LOGIC(),
      },
      {
        "text": "RETENTION POWER",
        "score": 0,
        "color": Colors.pink,
        'data': LOGIC(),
      },
      {
        "text": "HARD WORKING",
        "score": 0,
        "color": Colors.purple,
        'data': LOGIC(),
      },
      {
        "text": "FOSTUDY HABIT",
        "score": 0,
        "color": Colors.orange,
        'data': LOGIC(),
      },
      {
        "text": "CONSCIOUSNESS",
        "score": 0,
        "color": Colors.blue,
        'data': LOGIC(),
      },
    ],
    "Dark Trait": [
      {
        "text": "SILLY MISTAKES",
        "score": 0,
        "color": Colors.teal,
        'data': LOGIC(),
      },
      {
        "text": "KNOWLEDGE GAP",
        "score": 0,
        "color": Colors.yellow,
        'data': SILLYMISTAKES(),
      },
      {
        "text": "IMPULSIVE",
        "score": 0,
        "color": Colors.pink,
        'data': SILLYMISTAKES(),
      },
      {
        "text": "LEARNING GAP",
        "score": 0,
        "color": Colors.orange,
        'data': SILLYMISTAKES(),
      },
    ],
  }.obs;

  List<Map<String, dynamic>> get rows => traitTextMapping[selectedTrait.value]!;

  /// get bright traits
  Future<void> getBrightTraits() async {
    try {
      isLoading(true);
      var res = await analyticsRepo.getBrightTraits();
      if (res.data != null && res.data?.status == true) {
        // brightTraitsResponse.value = res.data;
        var listOftext = traitTextMapping['Bright Trait'];
        listOftext?[0]['score'] = res.data?.data?.lOGIC?.score ?? "";
        listOftext?[0]['data'] = res.data?.data?.lOGIC ?? LOGIC();
        listOftext?[1]['score'] = res.data?.data?.cONCENTRATION?.score ?? "";
        listOftext?[1]['data'] = res.data?.data?.cONCENTRATION ?? LOGIC();
        listOftext?[2]['score'] = res.data?.data?.cOGNITIVESKILL?.score ?? "";
        listOftext?[2]['data'] = res.data?.data?.cOGNITIVESKILL ?? LOGIC();
        listOftext?[3]['score'] = res.data?.data?.rETENTIONPOWER?.score ?? "";
        listOftext?[3]['data'] = res.data?.data?.rETENTIONPOWER ?? LOGIC();
        listOftext?[4]['score'] = res.data?.data?.hARDWORKING?.score ?? "";
        listOftext?[4]['data'] = res.data?.data?.hARDWORKING ?? LOGIC();
        listOftext?[5]['score'] = res.data?.data?.sTUDYHABIT?.score ?? "";
        listOftext?[5]['data'] = res.data?.data?.sTUDYHABIT ?? LOGIC();
        listOftext?[6]['score'] = res.data?.data?.cOGNITIVESKILL?.score ?? "";
        listOftext?[6]['data'] = res.data?.data?.cOGNITIVESKILL ?? LOGIC();
      } else {
        brightTraitsResponse.value = res.data;
      }
    } finally {
      isLoading(false);
    }
  }

  /// get dark traits
  Future<void> getDarkTraits() async {
    try {
      isLoading(true);

      var res = await analyticsRepo.getDarkTraits();
      if (res.data != null && res.data?.status == true) {
        // darktTraitsResponse.value = res.data;
        var listOftext = traitTextMapping['Dark Trait'];
        listOftext?[0]['score'] = res.data?.data?.sILLYMISTAKES?.score ?? "";
        listOftext?[0]['data'] = res.data?.data?.sILLYMISTAKES ?? LOGIC();
        listOftext?[1]['score'] = res.data?.data?.kNOWLEDGEGAP?.score ?? "";
        listOftext?[1]['data'] = res.data?.data?.kNOWLEDGEGAP ?? LOGIC();
        listOftext?[2]['score'] = res.data?.data?.iMPULSIVE?.score ?? "";
        listOftext?[2]['data'] = res.data?.data?.iMPULSIVE ?? LOGIC();
        listOftext?[3]['score'] = res.data?.data?.lEARNINGGAP?.score ?? "";
        listOftext?[3]['data'] = res.data?.data?.lEARNINGGAP ?? LOGIC();
      } else {
        darktTraitsResponse.value = res.data;
      }
    } finally {
      isLoading(false);
    }
  }

  getTopicRecomandation() async {
   try {
      isLoading(true);
     
      var res = await analyticsRepo.getTopicRecomandationRepo();
      if (res.data != null && res.data?.status == true) {
        topicModel.value = res.data;
      } else {
        htmlContent.value = "";
      }
    } finally {
      isLoading(false);
    }
  }
}
