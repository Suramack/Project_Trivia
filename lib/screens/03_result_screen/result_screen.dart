import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_trivia/controller/questions_view_controller.dart';
import 'package:project_trivia/screens/01_home_screen/home_screen.dart';
import 'package:project_trivia/screens/02_questions_screen/question_screen.dart';
import 'package:project_trivia/constant/style/style.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  _ScoreScreenState createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  final questionsViewController = Get.put(QuestionsViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('TRIVIA APP'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 3,
                    ),
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'SCORE',
                    style: scoreTextStyle(),
                  ),
                  GetBuilder<QuestionsViewController>(
                    builder: (_) {
                      return Text(
                        questionsViewController.points.toString(),
                        style: pointTextStyle(),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(150, 45)),
                    maximumSize: MaterialStateProperty.all(const Size(150, 45)),
                    backgroundColor: MaterialStateProperty.all(Colors.amber),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      (MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      )),
                    );
                  },
                  child: const Text('Go Home'),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(150, 45)),
                    maximumSize: MaterialStateProperty.all(const Size(150, 45)),
                    backgroundColor: MaterialStateProperty.all(Colors.amber),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      (MaterialPageRoute(
                        builder: (context) => const QuestionScreen(),
                      )),
                    );
                  },
                  child: const Text('Retake TRIVIA'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
