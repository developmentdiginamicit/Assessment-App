class DartTraitResponse {
  bool? status;
  Data? data;
  String? message;

  DartTraitResponse({this.status, this.data, this.message});

  DartTraitResponse.fromJson(Map<String, dynamic> json) {
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
  SILLYMISTAKES? sILLYMISTAKES;
  SILLYMISTAKES? kNOWLEDGEGAP;
  SILLYMISTAKES? iMPULSIVE;
  SILLYMISTAKES? lEARNINGGAP;

  Data(
      {this.sILLYMISTAKES,
      this.kNOWLEDGEGAP,
      this.iMPULSIVE,
      this.lEARNINGGAP});

  Data.fromJson(Map<String, dynamic> json) {
    sILLYMISTAKES = json['SILLY MISTAKES'] != null
        ? SILLYMISTAKES.fromJson(json['SILLY MISTAKES'])
        : null;
    kNOWLEDGEGAP = json['KNOWLEDGE GAP'] != null
        ? SILLYMISTAKES.fromJson(json['KNOWLEDGE GAP'])
        : null;
    iMPULSIVE = json['IMPULSIVE'] != null
        ? SILLYMISTAKES.fromJson(json['IMPULSIVE'])
        : null;
    lEARNINGGAP = json['LEARNING GAP'] != null
        ? SILLYMISTAKES.fromJson(json['LEARNING GAP'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sILLYMISTAKES != null) {
      data['SILLY MISTAKES'] = sILLYMISTAKES!.toJson();
    }
    if (kNOWLEDGEGAP != null) {
      data['KNOWLEDGE GAP'] = kNOWLEDGEGAP!.toJson();
    }
    if (iMPULSIVE != null) {
      data['IMPULSIVE'] = iMPULSIVE!.toJson();
    }
    if (lEARNINGGAP != null) {
      data['LEARNING GAP'] = lEARNINGGAP!.toJson();
    }
    return data;
  }
}

class SILLYMISTAKES {
  String? score;
  Recommendations? recommendations;
  String? averageScore;
  String? maximumScore;
  String? idealScore;

  SILLYMISTAKES(
      {this.score,
      this.recommendations,
      this.averageScore,
      this.maximumScore,
      this.idealScore});

  SILLYMISTAKES.fromJson(Map<String, dynamic> json) {
    score = json['score'];
    recommendations = json['recommendations'] != null
        ? Recommendations.fromJson(json['recommendations'])
        : null;
    averageScore = json['average_score'];
    maximumScore = json['maximum_score'];
    idealScore = json['ideal_score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['score'] = score;
    if (recommendations != null) {
      data['recommendations'] = recommendations!.toJson();
    }
    data['average_score'] = averageScore;
    data['maximum_score'] = maximumScore;
    data['ideal_score'] = idealScore;
    return data;
  }
}

class Recommendations {
  String? statement;
  List<Solutions>? solutions;

  Recommendations({this.statement, this.solutions});

  Recommendations.fromJson(Map<String, dynamic> json) {
    statement = json['statement'];
    if (json['solutions'] != null) {
      solutions = <Solutions>[];
      json['solutions'].forEach((v) {
        solutions!.add(Solutions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statement'] = statement;
    if (solutions != null) {
      data['solutions'] = solutions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Solutions {
  String? solutionHeadline;
  List<String>? solutionBulletPoints;

  Solutions({this.solutionHeadline, this.solutionBulletPoints});

  Solutions.fromJson(Map<String, dynamic> json) {
    solutionHeadline = json['solution_headline'];
    solutionBulletPoints = json['solution_bullet_points'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['solution_headline'] = solutionHeadline;
    data['solution_bullet_points'] = solutionBulletPoints;
    return data;
  }
}
