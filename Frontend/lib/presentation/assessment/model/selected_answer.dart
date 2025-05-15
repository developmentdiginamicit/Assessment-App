class SelectedAnswer {
  String? questionID;
  String? justification;
  String? optionId;
  int? index;
  bool isReview;

  SelectedAnswer(
      {this.justification,
      this.questionID,
      this.optionId,
      this.isReview = false});

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'questionID': questionID,
      'justification': justification,
      'optionId': optionId,
      'index': index,
    };
  }
}
