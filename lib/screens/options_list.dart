import 'package:project_trivia/models/model.dart';

List<String> optionsList(List<Results> object, int index) {
  List<String> listOfOptions = [];
  for (int i = 0; i < object[index].options.length; i++) {
    listOfOptions.add(object[index].options[i]);
  }

  listOfOptions.add(object[index].answer);
  listOfOptions.sort((a, b) => a.toString().compareTo(b.toString()));
  return listOfOptions;
}
