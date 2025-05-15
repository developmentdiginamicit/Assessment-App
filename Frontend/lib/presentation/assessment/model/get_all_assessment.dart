class AssessmentResponse {
  final bool? status;
  final List<AssessmentModel> data;
  final String message;

  AssessmentResponse({
    required this.status,
    required this.data,
    required this.message,
  });

  factory AssessmentResponse.fromJson(Map<String, dynamic> json) {
    return AssessmentResponse(
      status: json['status'] == 'true',
      data: (json['data'] as List<dynamic>)
          .map((item) => AssessmentModel.fromJson(item))
          .toList(),
      message: json['message'],
    );
  }
}

class AssessmentModel {
  final String? id;
  final String? assessmentId;
  final String? assessmentTitle;
  final String? assessmentDescription;
  final String? assessmentDisplayName;
  final String? assessmentClass;
  final String? board;
  final String? assessmentDuration;
  final int? totalNumberOfQuestions;
  final List<int>? withoutJustificationQuestions;
  final String? status;
  final int? version;

  AssessmentModel({
    this.id,
    this.assessmentId,
    this.assessmentTitle,
    this.assessmentDescription,
    this.assessmentDisplayName,
    this.assessmentClass,
    this.board,
    this.assessmentDuration,
    this.totalNumberOfQuestions,
    this.withoutJustificationQuestions,
    this.status,
    this.version,
  });

  factory AssessmentModel.fromJson(Map<String, dynamic> json) {
    return AssessmentModel(
      id: json['_id'],
      assessmentId: json['assessment_id'],
      assessmentTitle: json['assessment_title'],
      assessmentDescription: json['assessment_description'],
      assessmentDisplayName: json['asssessment_display_name'],
      assessmentClass: json['class'],
      board: json['board'],
      assessmentDuration: json['assessment_duration'],
      totalNumberOfQuestions: json['total_number_of_questions'],
      withoutJustificationQuestions:
          json['without_justification_questions'] != null
              ? List<int>.from(json['without_justification_questions'])
              : null,
      status: json['status'],
      version: json['__v'],
    );
  }
}
