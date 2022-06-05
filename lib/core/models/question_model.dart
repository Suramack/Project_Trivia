class QuestionsModel {
  int? responseCode;
  List<Results> results;
  QuestionsModel({this.responseCode, required this.results});
  factory QuestionsModel.fromJson(Map<String, dynamic> json) {
    var obj = json['results'];
    return QuestionsModel(
      responseCode: json['response_code'],
      results: List<Results>.from(obj.map((x) => Results.fromJson(x))),
    );
  }
}

class Results {
  final String type;
  final String question;
  final String answer;
  final List<dynamic> options;
  Results(
      {required this.type,
      required this.question,
      required this.answer,
      required this.options});
  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      type: json['type'],
      question: json['question'],
      answer: json['correct_answer'],
      options: json['incorrect_answers'],
    );
  }
}
