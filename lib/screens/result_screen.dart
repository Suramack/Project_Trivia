import 'package:flutter/material.dart';
import 'package:project_trivia/screens/home_screen.dart';
import 'package:project_trivia/screens/question_screen.dart';
import 'package:project_trivia/screens/style.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  _ScoreScreenState createState() => _ScoreScreenState();
}

int totalPoint = 0;
void getTotalPoint(int value) {
  totalPoint = value;
}

class _ScoreScreenState extends State<ScoreScreen> {
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
                  Text(
                    totalPoint.toString(),
                    style: pointTextStyle(),
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
                    Navigator.pushAndRemoveUntil(
                        context,
                        (MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        )),
                        (route) => false);
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
                    Navigator.pushAndRemoveUntil(
                        context,
                        (MaterialPageRoute(
                          builder: (context) => const QuestionScreen(),
                        )),
                        (route) => false);
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
