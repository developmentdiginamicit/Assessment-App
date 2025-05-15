class AssessmentIntroModel {
	bool? status;
	Data? data;
	String? message;

	AssessmentIntroModel({this.status, this.data, this.message});

	AssessmentIntroModel.fromJson(Map<String, dynamic> json) {
		status = json['status'];
		data = json['data'] != null ? Data.fromJson(json['data']) : null;
		message = json['message'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['status'] = status;
		if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
		data['message'] = message;
		return data;
	}
}

class Data {
	String? sId;
	String? assessmentId;
	String? asssessmentDisplayName;
	String? classess;
	String? board;
	String? assessmentDuration;
	AssessmentInstructions? assessmentInstructions;
	int? iV;

	Data({this.sId, this.assessmentId, this.asssessmentDisplayName, this.classess, this.board, this.assessmentDuration, this.assessmentInstructions, this.iV});

	Data.fromJson(Map<String, dynamic> json) {
		sId = json['_id'];
		assessmentId = json['assessment_id'];
		asssessmentDisplayName = json['asssessment_display_name'];
		classess = json['class'];
		board = json['board'];
		assessmentDuration = json['assessment_duration'];
		assessmentInstructions = json['assessment_instructions'] != null ? AssessmentInstructions.fromJson(json['assessment_instructions']) : null;
		iV = json['__v'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['_id'] = sId;
		data['assessment_id'] = assessmentId;
		data['asssessment_display_name'] = asssessmentDisplayName;
		data['class'] = classess;
		data['board'] = board;
		data['assessment_duration'] = assessmentDuration;
		if (assessmentInstructions != null) {
      data['assessment_instructions'] = assessmentInstructions!.toJson();
    }
		data['__v'] = iV;
		return data;
	}
}

class AssessmentInstructions {
	String? dynamicTime;
	Instructions? instructions;

	AssessmentInstructions({this.dynamicTime, this.instructions});

	AssessmentInstructions.fromJson(Map<String, dynamic> json) {
		dynamicTime = json['dynamic_time'];
		instructions = json['instructions'] != null ? Instructions.fromJson(json['instructions']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['dynamic_time'] = dynamicTime;
		if (instructions != null) {
      data['instructions'] = instructions!.toJson();
    }
		return data;
	}
}

class Instructions {
	ExamConduct? examConduct;
	ExamInstructions? examInstructions;
	List<String>? declaration;
	AdditionalInformation? additionalInformation;

	Instructions({this.examConduct, this.examInstructions, this.declaration, this.additionalInformation});

	Instructions.fromJson(Map<String, dynamic> json) {
		examConduct = json['Exam Conduct'] != null ? ExamConduct.fromJson(json['Exam Conduct']) : null;
		examInstructions = json['Exam Instructions'] != null ? ExamInstructions.fromJson(json['Exam Instructions']) : null;
		declaration = json['Declaration'].cast<String>();
		additionalInformation = json['Additional Information'] != null ? AdditionalInformation.fromJson(json['Additional Information']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		if (examConduct != null) {
      data['Exam Conduct'] = examConduct!.toJson();
    }
		if (examInstructions != null) {
      data['Exam Instructions'] = examInstructions!.toJson();
    }
		data['Declaration'] = declaration;
		if (additionalInformation != null) {
      data['Additional Information'] = additionalInformation!.toJson();
    }
		return data;
	}
}

class ExamConduct {
	List<String>? environment;
	List<String>? communication;
	List<String>? materials;
	List<String>? technicalIssues;

	ExamConduct({this.environment, this.communication, this.materials, this.technicalIssues});

	ExamConduct.fromJson(Map<String, dynamic> json) {
		environment = json['Environment'].cast<String>();
		communication = json['Communication'].cast<String>();
		materials = json['Materials'].cast<String>();
		technicalIssues = json['Technical Issues'].cast<String>();
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['Environment'] = environment;
		data['Communication'] = communication;
		data['Materials'] = materials;
		data['Technical Issues'] = technicalIssues;
		return data;
	}
}

class ExamInstructions {
	String? questionReading;
	List<String>? timing;
	String? savingProgress;
	List<String>? browserAndTimer;
	List<String>? submission;

	ExamInstructions({this.questionReading, this.timing, this.savingProgress, this.browserAndTimer, this.submission});

	ExamInstructions.fromJson(Map<String, dynamic> json) {
		questionReading = json['Question Reading'];
		timing = json['Timing'].cast<String>();
		savingProgress = json['Saving Progress'];
		browserAndTimer = json['Browser and Timer'].cast<String>();
		submission = json['Submission'].cast<String>();
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['Question Reading'] = questionReading;
		data['Timing'] = timing;
		data['Saving Progress'] = savingProgress;
		data['Browser and Timer'] = browserAndTimer;
		data['Submission'] = submission;
		return data;
	}
}

class AdditionalInformation {
	String? technicalSupport;
	String? accessibility;
	String? feedback;

	AdditionalInformation({this.technicalSupport, this.accessibility, this.feedback});

	AdditionalInformation.fromJson(Map<String, dynamic> json) {
		technicalSupport = json['Technical Support'];
		accessibility = json['Accessibility'];
		feedback = json['Feedback'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['Technical Support'] = technicalSupport;
		data['Accessibility'] = accessibility;
		data['Feedback'] = feedback;
		return data;
	}
}
