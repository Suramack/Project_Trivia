import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_trivia/controller/questions_view_controller.dart';
import 'package:project_trivia/screens/02_questions_screen/components/multiple_questions_widget.dart';
import 'package:project_trivia/constant/style/style.dart';
import 'package:project_trivia/screens/02_questions_screen/components/true_or_false_questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final questionsViewController = Get.put(QuestionsViewController());

  @override
  void initState() {
    questionsViewController.getQuestionsRequest();
    super.initState();
  }

  @override
  void dispose() {
// Deleting controller
    Get.delete<QuestionsViewController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('TRIVIA APP'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 150),
            GetBuilder<QuestionsViewController>(
              builder: (_) {
                return questionsViewController.questionsModel == null
                    ? const Center(child: CircularProgressIndicator())
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Question ${questionsViewController.questionNumber + 1}',
                            style: questionTextStyle(),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            questionsViewController
                                .questions![
                                    questionsViewController.questionNumber]
                                .question,
                            style: questionsTextStyle(),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Select any choices',
                            style: selectCoiceTextStyle(),
                          ),
                          questionsViewController
                                      .questions![questionsViewController
                                          .questionNumber]
                                      .type ==
                                  'multiple'
                              ? MultipleTypeQuestonsWidget(
                                  questionsViewController)
                              : TrueOrFalseQuestionsWidget(
                                  questionsViewController),
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all(
                                      const Size(100, 45)),
                                  maximumSize: MaterialStateProperty.all(
                                      const Size(120, 45)),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.amber),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  questionsViewController.nextQuestion(context);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Next',
                                      style: nextTextStyle(),
                                    ),
                                    const Icon(Icons.arrow_forward),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
