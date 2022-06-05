import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_trivia/adapter/question__api_request.dart';
import 'package:project_trivia/core/models/question_model.dart';
import 'package:project_trivia/screens/03_result_screen/result_screen.dart';

class QuestionsViewController extends GetxController {
  QuestionsModel? questionsModel;

  bool selectedTile = false;

  bool unSelectedTile = false;

  List<String>? options;

  List<Results>? questions;

  int questionNumber = 0;

  List<bool> isSelected = [
    false,
    false,
    false,
    false,
  ];

  int points = 0;

  Future getQuestionsRequest() async {
    questionNumber = 0;
    resetSelectionTile();
    questionsModel = await getQuestionsApiRequest();
    questions = questionsModel!.results;
    options = optionsList(questions!, questionNumber);
    update();
  }

  void setTrueOrFalseSelectedTile(int optionsIndex) {
    if (optionsIndex == 0) {
      isSelected[0] = !isSelected[0];
      isSelected[1] = false;
    }
    if (optionsIndex == 1) {
      isSelected[1] = !isSelected[1];
      isSelected[0] = false;
    }
    update();
  }

  void nextQuestion(BuildContext context) {
    if (questionNumber > 8) {
      Navigator.pushReplacement(
          context, (MaterialPageRoute(builder: (context) => ScoreScreen())));
    } else {
      questionNumber += 1;

      options = optionsList(questions!, questionNumber);
    }
    checkAndAddScore();
    resetSelectionTile();

    update();
  }

  void checkAndAddScore() {
    for (int i = 0; i < isSelected.length; i++) {
      if (isSelected[i] == true) {
        if (options![i] == questions![questionNumber].answer) {
          addScore();
          break;
        }
      }
    }
  }

  void resetSelectionTile() {
    isSelected = [
      false,
      false,
      false,
      false,
    ];
    update();
  }

  List<String> optionsList(List<Results> questionsAndAnswer, int index) {
    List<String> listOfOptions = [];

    for (int i = 0; i < questionsAndAnswer[index].options.length; i++) {
      listOfOptions.add(questionsAndAnswer[index].options[i]);
    }

    listOfOptions.add(questionsAndAnswer[index].answer);

    listOfOptions.sort((a, b) => a.toString().compareTo(b.toString()));
    return listOfOptions;
  }

  void addScore() {
    points += 10;
    update();
  }

  void setSelectedOption(int optionsIndex) {
    if (optionsIndex == 0) {
      isSelected[0] = !isSelected[0];
      isSelected[1] = false;
      isSelected[2] = false;
      isSelected[3] = false;
    }
    if (optionsIndex == 1) {
      isSelected[1] = !isSelected[1];
      isSelected[0] = false;
      isSelected[2] = false;
      isSelected[3] = false;
    }
    if (optionsIndex == 2) {
      isSelected[2] = !isSelected[2];
      isSelected[0] = false;
      isSelected[1] = false;
      isSelected[3] = false;
    }
    if (optionsIndex == 3) {
      isSelected[3] = !isSelected[3];
      isSelected[0] = false;
      isSelected[2] = false;
      isSelected[1] = false;
    }
    update();
  }
}
