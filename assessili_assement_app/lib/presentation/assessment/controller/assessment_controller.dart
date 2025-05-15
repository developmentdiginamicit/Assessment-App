import 'dart:async';
import 'package:assessili_assement_app/presentation/assessment/model/get_all_assessment.dart';
import 'package:assessili_assement_app/presentation/assessment/model/intro_model.dart';
import 'package:assessili_assement_app/presentation/assessment/presentaion/review_screen.dart';
import 'package:assessili_assement_app/presentation/base_widgets/toast_widget.dart';
import 'package:assessili_assement_app/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/assessment/assessment.dart';
import '../../../utils/apphelper.dart';
import '../model/question_model.dart';
import '../model/selected_answer.dart';
import '../presentaion/widgets/submmit_assessment_screen.dart';

class AssessmentController extends GetxController {
  final assessmentRepo = AssessmentRepo();
  RxBool isLoading = false.obs;
  final Rx<TextEditingController> justifyController =
      TextEditingController().obs;
  final Rx<TextEditingController> reviewController =
      TextEditingController().obs;
  RxList<AssessmentModel> assessmentList = <AssessmentModel>[].obs;
  Rx<AssessmentIntroModel?> introModel = Rx<AssessmentIntroModel?>(null);
  RxString htmlContent = "".obs;
  RxString slectedSubject = "".obs;
  RxInt selectedSubjectIndex = 0.obs;
  RxBool isQuestionSelected = false.obs;
  RxInt attemptedQuestion = 0.obs;
  // RxMap<String, List<Map<String, Object?>>> answerMap =
  //     <String, List<Map<String, Object?>>>{}.obs;

  RxMap<String, Map<String, SelectedAnswer>> selectedAnswer =
      <String, Map<String, SelectedAnswer>>{}.obs;

  void updateSelectedAnswer({
    required AssessmentController assessmentController,
    required String subject,
    required String questionId,
    required String optionId,
    required String justification,
  }) {
    // Check if the subject exists in the selectedAnswer map
    if (assessmentController.selectedAnswer.containsKey(subject)) {
      final selectedAnswers = assessmentController.selectedAnswer[subject];

      // Check if the questionId exists within the subject
      if (selectedAnswers!.containsKey(questionId)) {
        // Update the existing entry
        selectedAnswers[questionId]!.optionId = optionId;
        selectedAnswers[questionId]!.justification = justification;
      } else {
        // Add a new entry for the questionId
        selectedAnswers[questionId] = SelectedAnswer(
          justification: justification,
          optionId: optionId,
        );
      }
    } else {
      // Create a new map for the subject and add the questionId
      Map<String, SelectedAnswer> selectedAnswer = {
        questionId: SelectedAnswer(
          justification: justification,
          optionId: optionId,
        ),
      };
      assessmentController.selectedAnswer.value[subject] = selectedAnswer;
    }
  }

  bool isSelectedAnawer(
      {required String subject,
      required String questionID,
      required String optionID}) {
    if (selectedAnswer[subject] != null && selectedAnswer.value.isNotEmpty) {
      return selectedAnswer[subject]![questionID]?.optionId == optionID;
    }
    return false;
  }

  String textFieldValue({
    required String subject,
    required String questionID,
  }) {
    if (selectedAnswer[subject] != null && selectedAnswer.value.isNotEmpty) {
      return selectedAnswer[subject]![questionID]?.justification ?? "";
    }
    return "";
  }

  bool categoryColor({
    required String subject,
    required String questionId,
  }) {
    if (!selectedAnswer.value.containsKey(subject)) {
      return false;
    }
    return selectedAnswer.value[subject]?.containsKey(questionId) ?? false;
  }

  /// read assessment
  RxBool isReadInstruction = false.obs;
  RxString assementID = ''.obs;

  /// calculate total question
  RxInt totalQuestions = 0.obs;
  findTotalQuestion() {
    totalQuestions.value = 0;
    for (int i = 0; i < questionsList.length; i++) {
      for (int j = 0; j < questionsList[i].questions!.length; j++) {
        totalQuestions++;
      }
    }
  }

  void readAssessment(bool value) {
    isReadInstruction.value = value;
  }

  /// get assessment list
  Future<void> getAllAssement() async {
    try {
      isLoading(true);
      assessmentList.value.clear();
      var res = await assessmentRepo.getAllAssement();
      if (res.data != null && res.data?.status == true) {
        assessmentList.value = res.data?.data ?? [];
      } else {
        assessmentList.value = res.data?.data ?? [];
      }
    } finally {
      isLoading(false);
    }
  }

  /// get assessment introduction
  Future<void> getAssessmentIntro({required String assessmentId}) async {
    try {
      isLoading(true);
      Map<String, dynamic> reqModel = {"assessment_id": assessmentId};
      var res = await assessmentRepo.getAssessmentIntro(reqModel: reqModel);
      if (res.data != null && res.data?.status == true) {
        introModel.value = res.data;
      } else {
        htmlContent.value = "";
      }
    } finally {
      isLoading(false);
    }
  }

  /// get question list
  ///

  RxList<String> subjectList = <String>[].obs;
  RxList<QuestionsList> questionsList = <QuestionsList>[].obs;
  RxList<Questions> questions = <Questions>[].obs;
  void fileterQuestion({required String subject}) {
    isLoading(true);
    if (questions.isNotEmpty) {
      questions.clear();
      subjectList.clear();
    }
    for (var i in questionsList) {
      subjectList.add(i.subject!);
      if (i.subject?.toLowerCase() == subject.toLowerCase()) {
        if (i.questions != null) {
          questions.addAll(i.questions!);
        }
      }
    }

    isLoading(false);
  }

  Future<void> getAllQuestion({required String assessmentId}) async {
    try {
      isLoading(true);
      if (questions.isNotEmpty) {
        questions.clear();
        subjectList.clear();
      }
      var res =
          await assessmentRepo.getQuestionRepo(assessmentId: assessmentId);
      if (res.data?.status == true) {
        questionsList.value = res.data?.data?.questionsList ?? [];
        slectedSubject.value = questionsList.first.subject ?? "";
        findTotalQuestion();
        fileterQuestion(subject: questionsList.first.subject ?? "");
      } else {
        questionsList.value = [];
      }
    } finally {
      isLoading(false);
    }
  }

  /// timer for introduction

  ///countdown
  RxString introTimer = "00:00".obs;
  Timer? timer1;
  int remainingIntroSeconds = 0;
  void startTimerIntro(String initialDuration) {
    remainingIntroSeconds = int.parse(initialDuration.replaceAll('s', ''));
    introTimer.value = getFormattedTime(remainingIntroSeconds); // Initialize UI
    timer1?.cancel();
    timer1 = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingIntroSeconds > 0) {
        remainingIntroSeconds--;
        introTimer.value = getFormattedTime(remainingIntroSeconds); // Update UI
      } else {
        timer1!.cancel(); // Stop the timer when time reaches zero
      }
    });
  }

  ///countdown
  RxString timeDuration = "00:00".obs;
  Timer? timer;
  int remainingSeconds = 0;
  void startTimer(String initialDuration) {
    remainingSeconds = int.parse(initialDuration.replaceAll('s', ''));
    timeDuration.value = getFormattedTime(remainingSeconds); // Initialize UI
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        remainingSeconds--;
        timeDuration.value = getFormattedTime(remainingSeconds); // Update UI
      } else {
        submitExam();
        loadingDialog(context: Get.context!, text: "Your Record is submitted");
        navigatePushReplacement(Get.context!, ReviewScreen());
        timer.cancel(); // Stop the timer when time reaches zero
      }
    });
  }

  String getFormattedTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  ///page view navigation
  final pageController = PageController().obs;
  RxInt currentPage = 0.obs; // Start with 0 to match PageView indexing.
  void animateToPage() {
    pageController.value.animateToPage(
      currentPage.value,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  RxBool removeRightIcon = false.obs;
  void goToNextPage(int totalQuestions) {
    removeLeftIcon.value = false;
    if (currentPage.value < totalQuestions - 1) {
      // Ensure valid upper bound.
      currentPage.value++;
      animateToPage();
    } else {
      print("vvvv");
      if (selectedSubjectIndex < subjectList.length - 1) {
        selectedSubjectIndex++;
        currentPage.value = 0;
        // currentPage.value++;
        slectedSubject.value = subjectList[selectedSubjectIndex.value];
        fileterQuestion(subject: slectedSubject.value);
        animateToPage();
      } else {
        removeRightIcon.value = true;
      }
    }
  }

  RxBool removeLeftIcon = false.obs;
  void goToPreviousPage(int totalQuestions) {
    removeRightIcon.value = false;
    if (currentPage.value > 0) {
      // Ensure valid upper bound.
      currentPage.value--;
      animateToPage();
    } else {
      print("vvvv");
      if (selectedSubjectIndex.value > 0) {
        selectedSubjectIndex--;
        currentPage.value = 0;
        currentPage.value--;
        slectedSubject.value = subjectList[selectedSubjectIndex.value];
        fileterQuestion(subject: slectedSubject.value);
        animateToPage();
      } else {
        // allQuestionDone.value = true;
      }
    }
  }

  // void goToPreviousPage() {
  //   if (currentPage.value > 0) {
  //     // Ensure valid lower bound.
  //     currentPage.value--;
  //     animateToPage();
  //   }
  // }

  /// review the question

  RxInt selectedIndexForReview = 0.obs;

  updateSelectedIndexForReview(int index) {
    selectedIndexForReview.value = index;
  }

  // Map to store TextEditingController for each question
  final Map<int, TextEditingController> justificationControllers =
      <int, TextEditingController>{};

  /// submmit Exam
  Future<void> submitExam() async {
    Map<String, dynamic> reqModel = {
      "student_id": "abc123",
      "name": "Abhinandan Dutta",
      "class": "class_9",
      "roll_number": "125",
      "schoolName": "MOklsbxjbc.kdwn",
      "schoolId": "MOklsbxjbc.kdwn",
      "email": "ab@ab.com",
      "board": "CBSE",
      "phoneNo": "9681754861",
      "section": "A",
      "assessment_id": "assessment_9",
      "responses": selectedAnswer.value
    };

    try {
      // loadingDialog(context: Get.context!, text: "Please wait...");
      var res = await assessmentRepo.submmitExam(reqModel: reqModel);
      print("staus --> ${res.data['status']}");
      if (res.data['status'] == true) {
        TostWidget().successToast(message: "Examp submitted");
        navigatePushReplacement(Get.context!, ReviewScreen());
      } else {
        TostWidget().errorToast(message: "Something went wrong!");
      }
    } finally {
      // Navigator.pop(Get.context!);
    }
  }

  /// review screen
  RxDouble ratirn = 1.0.obs;
  Future<void> reviewPost() async {
    Map<String, dynamic> reqModel = {
      "assessment_id": assementID.value,
      "student_id": "student123",
      "rating": ratirn.value,
      "review": reviewController.value.text
    };
    try {
      isLoading(true);
      var res = await assessmentRepo.reviewRepo(reqModel: reqModel);
      if (res.data['status'] == true) {
        reviewController.value.clear();
        TostWidget().successToast(message: res.data['message'] ?? "");
        navigatePushReplacement(Get.context!, const SubmmitAssessmentScreen());
      } else {}
    } finally {
      isLoading(false);
    }
  }
}
