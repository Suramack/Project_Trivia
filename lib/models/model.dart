import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class GetJsonModel {
  Future<Model> callApi() async {
    var model;
    var url = 'https://opentdb.com/api.php?amount=10';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('connection established');
      var body = response.body;
      model = Model.fromJson(jsonDecode(body));
    } else {
      log('apicall error');
    }
    return model;
  }
}

class Model {
  int? responseCode;
  List<Results> results;
  Model({this.responseCode, required this.results});
  factory Model.fromJson(Map<String, dynamic> json) {
    var obj = json['results'];
    return Model(
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
