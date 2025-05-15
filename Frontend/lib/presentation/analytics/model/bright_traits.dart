class BrightTraitsResponse {
  bool? status;
  Data? data;
  String? message;

  BrightTraitsResponse({this.status, this.data, this.message});

  BrightTraitsResponse.fromJson(Map<String, dynamic> json) {
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
  LOGIC? lOGIC;
  LOGIC? cONCENTRATION;
  LOGIC? fOCUS;
  LOGIC? cOGNITIVESKILL;
  LOGIC? rETENTIONPOWER;
  LOGIC? hARDWORKING;
  LOGIC? sTUDYHABIT;
  LOGIC? cONSCIOUSNESS;

  Data(
      {this.lOGIC,
      this.cONCENTRATION,
      this.fOCUS,
      this.cOGNITIVESKILL,
      this.rETENTIONPOWER,
      this.hARDWORKING,
      this.sTUDYHABIT,
      this.cONSCIOUSNESS});

  Data.fromJson(Map<String, dynamic> json) {
    lOGIC = json['LOGIC'] != null ? LOGIC.fromJson(json['LOGIC']) : null;
    cONCENTRATION = json['CONCENTRATION'] != null
        ? LOGIC.fromJson(json['CONCENTRATION'])
        : null;
    fOCUS = json['FOCUS'] != null ? LOGIC.fromJson(json['FOCUS']) : null;
    cOGNITIVESKILL = json['COGNITIVE SKILL'] != null
        ? LOGIC.fromJson(json['COGNITIVE SKILL'])
        : null;
    rETENTIONPOWER = json['RETENTION POWER'] != null
        ? LOGIC.fromJson(json['RETENTION POWER'])
        : null;
    hARDWORKING = json['HARD WORKING'] != null
        ? LOGIC.fromJson(json['HARD WORKING'])
        : null;
    sTUDYHABIT = json['STUDY HABIT'] != null
        ? LOGIC.fromJson(json['STUDY HABIT'])
        : null;
    cONSCIOUSNESS = json['CONSCIOUSNESS'] != null
        ? LOGIC.fromJson(json['CONSCIOUSNESS'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (lOGIC != null) {
      data['LOGIC'] = lOGIC!.toJson();
    }
    if (cONCENTRATION != null) {
      data['CONCENTRATION'] = cONCENTRATION!.toJson();
    }
    if (fOCUS != null) {
      data['FOCUS'] = fOCUS!.toJson();
    }
    if (cOGNITIVESKILL != null) {
      data['COGNITIVE SKILL'] = cOGNITIVESKILL!.toJson();
    }
    if (rETENTIONPOWER != null) {
      data['RETENTION POWER'] = rETENTIONPOWER!.toJson();
    }
    if (hARDWORKING != null) {
      data['HARD WORKING'] = hARDWORKING!.toJson();
    }
    if (sTUDYHABIT != null) {
      data['STUDY HABIT'] = sTUDYHABIT!.toJson();
    }
    if (cONSCIOUSNESS != null) {
      data['CONSCIOUSNESS'] = cONSCIOUSNESS!.toJson();
    }
    return data;
  }
}

class LOGIC {
  String? score;
  Recommendations? recommendations;
  String? averageScore;
  String? maximumScore;
  String? idealScore;

  LOGIC(
      {this.score,
      this.recommendations,
      this.averageScore,
      this.maximumScore,
      this.idealScore});

  LOGIC.fromJson(Map<String, dynamic> json) {
    score = json['score'];
    recommendations = json['recommendations'] != null
        ? Recommendations.fromJson(json['recommendations'])
        : null;
    averageScore = json['average_score'];
    maximumScore = json['maximum_score'];
    idealScore = json['ideal_score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
