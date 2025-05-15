// Main Model
class ExamModel {
  String? id;
  String? studentId;
  String? name;
  String? studentClass;
  String? rollNumber;
  String? schoolName;
  String? schoolId;
  String? email;
  String? board;
  String? phoneNo;
  String? section;
  String? assessmentId;
  ResponsesModel? responses;

  ExamModel({
    this.id,
     this.studentId,
     this.name,
     this.studentClass,
     this.rollNumber,
     this.schoolName,
     this.schoolId,
     this.email,
     this.board,
     this.phoneNo,
     this.section,
     this.assessmentId,
     this.responses,
  });

  // Method for JSON serialization
  Map<String, dynamic> toJson() => {
        "_id": id,
        "student_id": studentId,
        "name": name,
        "class": studentClass,
        "roll_number": rollNumber,
        "schoolName": schoolName,
        "schoolId": schoolId,
        "email": email,
        "board": board,
        "phoneNo": phoneNo,
        "section": section,
        "assessment_id": assessmentId,
        "responses": responses?.toJson(),
      };
}

// ResponsesModel Model
class ResponsesModel {
  List<QuestionResponse> science;
  List<QuestionResponse> math;

  ResponsesModel({
    required this.science,
    required this.math,
  });
  Map<String, dynamic> toJson() => {
        "science": List<dynamic>.from(science.map((x) => x.toJson())),
        "math": List<dynamic>.from(math.map((x) => x.toJson())),
      };
}

// Question Response Model
class QuestionResponse {
  int questionId;
  String optionSelected;
  String? justification;

  QuestionResponse({
    required this.questionId,
    required this.optionSelected,
    this.justification,
  });

  Map<String, dynamic> toJson() => {
        "question_id": questionId,
        "option_selected": optionSelected,
        "justification": justification,
      };
}
