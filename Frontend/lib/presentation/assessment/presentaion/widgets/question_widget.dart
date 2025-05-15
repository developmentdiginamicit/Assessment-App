import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../base_widgets/text_field.dart';
import '../../controller/assessment_controller.dart';
import '../../model/question_model.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({
    super.key,
    required this.questions,
    required this.page,
    required this.slectedSubject,
  });

  final int page;
  final Questions questions;
  final String slectedSubject;

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  final assessmentController = Get.put(AssessmentController());
  final Map<int, TextEditingController> justificationControllers = {};
  final textController = TextEditingController();
  int selectedInde = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    textController.text = assessmentController.textFieldValue(
      subject: widget.slectedSubject,
      questionID: widget.questions.questionId.toString(),
    );

    for (int i = 0; i < widget.questions.options!.length; i++) {
      if (widget.questions.options![i].sId ==
          assessmentController
              .selectedAnswer
              .value[widget.slectedSubject]
                  ?[widget.questions.questionId.toString()]
              ?.optionId) {
        selectedInde = i;
        break;
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          widget.questions.questionText ?? "",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 30.h),
        Obx(
          () => Column(
            children: List.generate(
              widget.questions.options!.length,
              (i) => InkWell(
                onTap: () {
                  selectedInde = i;
                  assessmentController.updateSelectedAnswer(
                    assessmentController: assessmentController,
                    subject: widget.slectedSubject,
                    questionId: widget.questions.questionId.toString(),
                    optionId: widget.questions.options![selectedInde].sId ?? "",
                    justification: textController.text,
                  );
                  setState(() {});
                },
                child: questionContainer(
                  color: assessmentController.isSelectedAnawer(
                          subject: widget.slectedSubject,
                          questionID: widget.questions.questionId.toString(),
                          optionID: widget.questions.options?[i].sId ?? "")
                      ? Colors.green
                      : Colors.white,
                  textColor: Colors.black,
                  text: widget.questions.options?[i].text ?? "",
                  option: widget.questions.options?[i].option ?? "",
                ),
              ),
            ),
          ),
        ),
        // Show justification field only if an option is selected.
        assessmentController.isSelectedAnawer(
                subject: widget.slectedSubject,
                questionID: widget.questions.questionId.toString(),
                optionID: widget.questions.options?[selectedInde].sId ?? "")
            ? Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Please justify your selection *",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h, bottom: 20.h),
                    child: CustomTextField(
                      controller: textController,
                      fillColor: Colors.white,
                      maxLine: 2,
                      disableBorderColor: Colors.white,
                      enableBorderColor: Colors.white,
                      border: 10.r,
                      onChanged: (text) {
                        EasyDebounce.debounce(
                            'my-debouncer', // <-- An ID for this particular debouncer
                            const Duration(
                                milliseconds: 500), // <-- The debounce duration
                            () {
                          assessmentController.updateSelectedAnswer(
                            assessmentController: assessmentController,
                            subject: widget.slectedSubject,
                            questionId: widget.questions.questionId.toString(),
                            optionId:
                                widget.questions.options![selectedInde].sId ??
                                    "",
                            justification: textController.text,
                          );
                        });
                      },
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  Widget questionContainer({
    required Color color,
    required Color textColor,
    required String text,
    required String option,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      margin: EdgeInsets.only(bottom: 13.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Row(
        children: [
          Text(
            "$option.",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
