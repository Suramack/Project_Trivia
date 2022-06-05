import 'package:project_trivia/adapter/keys/keys.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:project_trivia/core/models/question_model.dart';

Future<QuestionsModel> getQuestionsApiRequest() async {
  var client = http.Client();
  var url = urlPath;
  var response;
  QuestionsModel? questionsModel;
  try {
    response = await client.get(Uri.parse(url));
  } catch (e) {
    print(e);
  }

  if (response.statusCode == 200) {
    var body = response.body;
    questionsModel = QuestionsModel.fromJson(jsonDecode(body));
  } else {
    print('apicall error');
  }
  return questionsModel!;
}
