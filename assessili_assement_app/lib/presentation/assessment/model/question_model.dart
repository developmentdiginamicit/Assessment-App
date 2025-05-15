import 'dart:developer';

class QuestionsModel {
  bool? status;
  Data? data;
  String? message;

  QuestionsModel({this.status, this.data, this.message});

  QuestionsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    log(json['data'].toString());
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
  List<QuestionsList>? questionsList;
  int? iV;

  Data({this.sId, this.assessmentId, this.questionsList, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    assessmentId = json['assessment_id'];
    if (json['questions_list'] != null) {
      questionsList = <QuestionsList>[];
      json['questions_list'].forEach((v) {
        questionsList!.add(QuestionsList.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['assessment_id'] = assessmentId;
    if (questionsList != null) {
      data['questions_list'] = questionsList!.map((v) => v.toJson()).toList();
    }
    data['__v'] = iV;
    return data;
  }
}

class QuestionsList {
  String? sId;
  String? subject;
  List<Questions>? questions;

  QuestionsList({this.sId, this.subject, this.questions});

  QuestionsList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    subject = json['subject'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['subject'] = subject;
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  String? sId;
  int? questionId;
  String? questionImageUrl;
  String? questionText;
  List<Options>? options;

  Questions(
      {this.sId,
      this.questionId,
      this.questionImageUrl,
      this.questionText,
      this.options});

  Questions.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    questionId = json['question_id'];
    questionImageUrl = json['question_image_url'];
    questionText = json['question_text'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(Options.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['question_id'] = questionId;
    data['question_image_url'] = questionImageUrl;
    data['question_text'] = questionText;
    if (options != null) {
      data['options'] = options!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Options {
  String? sId;
  String? option;
  String? text;
  String? optionImageUrl;

  Options({this.sId, this.option, this.text, this.optionImageUrl});

  Options.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    option = json['option'];
    text = json['text'];
    optionImageUrl = json['option_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['option'] = option;
    data['text'] = text;
    data['option_image_url'] = optionImageUrl;
    return data;
  }
}
