// class TopicModel {
//   bool? status;
//   Data? data;
//   String? message;

//   TopicModel({this.status, this.data, this.message});

//   TopicModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//     message = json['message'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['message'] = this.message;
//     return data;
//   }
// }

// class Data {
//   String? sId;
//   AttemptCount? attemptCount;
//   Recommendations? recommendations;
//   int? iV;

//   Data({this.sId, this.attemptCount, this.recommendations, this.iV});

//   Data.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     attemptCount = json['attempt_count'] != null
//         ? new AttemptCount.fromJson(json['attempt_count'])
//         : null;
//     recommendations = json['recommendations'] != null
//         ? new Recommendations.fromJson(json['recommendations'])
//         : null;
//     iV = json['__v'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     if (this.attemptCount != null) {
//       data['attempt_count'] = this.attemptCount!.toJson();
//     }
//     if (this.recommendations != null) {
//       data['recommendations'] = this.recommendations!.toJson();
//     }
//     data['__v'] = this.iV;
//     return data;
//   }
// }

// class AttemptCount {
//   String? correctAttempt;
//   String? incorrectAttempt;
//   String? unattempted;

//   AttemptCount({this.correctAttempt, this.incorrectAttempt, this.unattempted});

//   AttemptCount.fromJson(Map<String, dynamic> json) {
//     correctAttempt = json['correct_attempt'];
//     incorrectAttempt = json['incorrect_attempt'];
//     unattempted = json['unattempted'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['correct_attempt'] = this.correctAttempt;
//     data['incorrect_attempt'] = this.incorrectAttempt;
//     data['unattempted'] = this.unattempted;
//     return data;
//   }
// }

// class Recommendations {
//   IncorrectAttempt? incorrectAttempt;
//   CorrectAttempt? correctAttempt;
//   CorrectAttempt? unattempted;

//   Recommendations(
//       {this.incorrectAttempt, this.correctAttempt, this.unattempted});

//   Recommendations.fromJson(Map<String, dynamic> json) {
//     incorrectAttempt = json['incorrect_attempt'] != null
//         ? new IncorrectAttempt.fromJson(json['incorrect_attempt'])
//         : null;
//     correctAttempt = json['correct_attempt'] != null
//         ? new CorrectAttempt.fromJson(json['correct_attempt'])
//         : null;
//     unattempted = json['unattempted'] != null
//         ? new CorrectAttempt.fromJson(json['unattempted'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.incorrectAttempt != null) {
//       data['incorrect_attempt'] = this.incorrectAttempt!.toJson();
//     }
//     if (this.correctAttempt != null) {
//       data['correct_attempt'] = this.correctAttempt!.toJson();
//     }
//     if (this.unattempted != null) {
//       data['unattempted'] = this.unattempted!.toJson();
//     }
//     return data;
//   }
// }

// class IncorrectAttempt {
//   double? incorrectPercent;
//   int? incorrectCount;
//   List<Recommendation>? recommendation;

//   IncorrectAttempt(
//       {this.incorrectPercent, this.incorrectCount, this.recommendation});

//   IncorrectAttempt.fromJson(Map<String, dynamic> json) {
//     incorrectPercent = json['incorrect_percent'];
//     incorrectCount = json['incorrect_count'];
//     if (json['recommendation'] != null) {
//       recommendation = <Recommendation>[];
//       json['recommendation'].forEach((v) {
//         recommendation!.add(new Recommendation.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['incorrect_percent'] = this.incorrectPercent;
//     data['incorrect_count'] = this.incorrectCount;
//     if (this.recommendation != null) {
//       data['recommendation'] =
//           this.recommendation!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Recommendation {
//   String? title;
//   Details? details;

//   Recommendation({this.title, this.details});

//   Recommendation.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//     details =
//         json['details'] != null ? new Details.fromJson(json['details']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['title'] = this.title;
//     if (this.details != null) {
//       data['details'] = this.details!.toJson();
//     }
//     return data;
//   }
// }

// class Details {
//   List<String>? sequencesAndSeries;
//   List<String>? simplificationOfExpressions;
//   List<String>? polynomials;
//   List<String>? seriesSummation;
//   List<String>? integerSolutions;
//   List<String>? meanCalculation;
//   List<String>? distribution;
//   List<String>? ageProblems;
//   List<String>? compoundRatios;
//   List<String>? areaAndPerimeter;
//   List<String>? parallelLinesAndTransversals;
//   List<String>? parallelLinesAndAngles;
//   List<String>? areaAndPercentage;
//   List<String>? divisibilityRules;

//   Details(
//       {this.sequencesAndSeries,
//       this.simplificationOfExpressions,
//       this.polynomials,
//       this.seriesSummation,
//       this.integerSolutions,
//       this.meanCalculation,
//       this.distribution,
//       this.ageProblems,
//       this.compoundRatios,
//       this.areaAndPerimeter,
//       this.parallelLinesAndTransversals,
//       this.parallelLinesAndAngles,
//       this.areaAndPercentage,
//       this.divisibilityRules});

// Details.fromJson(Map<String, dynamic> json) {
//   sequencesAndSeries = json['Sequences and Series']?.cast<String>() ?? [];
//   simplificationOfExpressions =
//       json['Simplification of Expressions']?.cast<String>() ?? [];
//   polynomials = json['Polynomials']?.cast<String>() ?? [];
//   seriesSummation = json['Series Summation']?.cast<String>() ?? [];
//   integerSolutions = json['Integer Solutions']?.cast<String>() ?? [];
//   meanCalculation = json['Mean Calculation']?.cast<String>() ?? [];
//   distribution = json['Distribution']?.cast<String>() ?? [];
//   ageProblems = json['Age Problems']?.cast<String>() ?? [];
//   compoundRatios = json['Compound Ratios']?.cast<String>() ?? [];
//   areaAndPerimeter = json['Area and Perimeter']?.cast<String>() ?? [];
//   parallelLinesAndTransversals =
//       json['Parallel Lines and Transversals']?.cast<String>() ?? [];
//   parallelLinesAndAngles =
//       json['Parallel Lines and Angles']?.cast<String>() ?? [];
//   areaAndPercentage = json['Area and Percentage']?.cast<String>() ?? [];
//   divisibilityRules = json['Divisibility Rules']?.cast<String>() ?? [];
// }


//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Sequences and Series'] = this.sequencesAndSeries;
//     data['Simplification of Expressions'] = this.simplificationOfExpressions;
//     data['Polynomials'] = this.polynomials;
//     data['Series Summation'] = this.seriesSummation;
//     data['Integer Solutions'] = this.integerSolutions;
//     data['Mean Calculation'] = this.meanCalculation;
//     data['Distribution'] = this.distribution;
//     data['Age Problems'] = this.ageProblems;
//     data['Compound Ratios'] = this.compoundRatios;
//     data['Area and Perimeter'] = this.areaAndPerimeter;
//     data['Parallel Lines and Transversals'] = this.parallelLinesAndTransversals;
//     data['Parallel Lines and Angles'] = this.parallelLinesAndAngles;
//     data['Area and Percentage'] = this.areaAndPercentage;
//     data['Divisibility Rules'] = this.divisibilityRules;
//     return data;
//   }
// }

// class CorrectAttempt {
//   List<Recommendation>? recommendation;

//   CorrectAttempt({this.recommendation});

//   CorrectAttempt.fromJson(Map<String, dynamic> json) {
//     if (json['recommendation'] != null) {
//       recommendation = <Recommendation>[];
//       json['recommendation'].forEach((v) {
//         recommendation!.add(new Recommendation.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.recommendation != null) {
//       data['recommendation'] =
//           this.recommendation!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }


class TopicModel {
  bool? status;
  Data? data;
  String? message;

  TopicModel({this.status, this.data, this.message});

  TopicModel.fromJson(Map<String, dynamic> json) {
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
  AttemptCount? attemptCount;
  Recommendations? recommendations;
  int? iV;

  Data({this.sId, this.attemptCount, this.recommendations, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    attemptCount = json['attempt_count'] != null
        ? AttemptCount.fromJson(json['attempt_count'])
        : null;
    recommendations = json['recommendations'] != null
        ? Recommendations.fromJson(json['recommendations'])
        : null;
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (attemptCount != null) {
      data['attempt_count'] = attemptCount!.toJson();
    }
    if (recommendations != null) {
      data['recommendations'] = recommendations!.toJson();
    }
    data['__v'] = iV;
    return data;
  }
}

class AttemptCount {
  String? correctAttempt;
  String? incorrectAttempt;
  String? unattempted;

  AttemptCount({this.correctAttempt, this.incorrectAttempt, this.unattempted});

  AttemptCount.fromJson(Map<String, dynamic> json) {
    correctAttempt = json['correct_attempt'];
    incorrectAttempt = json['incorrect_attempt'];
    unattempted = json['unattempted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['correct_attempt'] = correctAttempt;
    data['incorrect_attempt'] = incorrectAttempt;
    data['unattempted'] = unattempted;
    return data;
  }
}

class Recommendations {
  CorrectAttempt? correctAttempt;
  CorrectAttempt? unattempted;

  Recommendations({this.correctAttempt, this.unattempted});

  Recommendations.fromJson(Map<String, dynamic> json) {
    correctAttempt = json['correct_attempt'] != null
        ? CorrectAttempt.fromJson(json['correct_attempt'])
        : null;
    unattempted = json['unattempted'] != null
        ? CorrectAttempt.fromJson(json['unattempted'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (correctAttempt != null) {
      data['correct_attempt'] = correctAttempt!.toJson();
    }
    if (unattempted != null) {
      data['unattempted'] = unattempted!.toJson();
    }
    return data;
  }
}

class CorrectAttempt {
  List<Recommendation>? recommendation;

  CorrectAttempt({this.recommendation});

  CorrectAttempt.fromJson(Map<String, dynamic> json) {
    if (json['recommendation'] != null) {
      recommendation = <Recommendation>[];
      json['recommendation'].forEach((v) {
        recommendation!.add(Recommendation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (recommendation != null) {
      data['recommendation'] =
          recommendation!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Recommendation {
  String? title;
  String? details;

  Recommendation({this.title, this.details});

  Recommendation.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    details = json['details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['details'] = details;
    return data;
  }
}



