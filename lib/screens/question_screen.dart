import 'package:flutter/material.dart';
import 'package:project_trivia/models/model.dart';
import 'package:project_trivia/screens/options_list.dart';
import 'package:project_trivia/screens/result_screen.dart';
import 'package:project_trivia/screens/style.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  Future<Model>? _model;
  int index = 0;
  List<bool> isSelected = [];
  int points = 0;

  void resetSelectionTile() {
    isSelected = [
      false,
      false,
      false,
      false,
    ];
  }

  void score() {
    points += 10;
  }

  bool selectedTile = false;
  bool unSelectedTile = false;
  List<String>? options;
  var parsedJson;

  @override
  void initState() {
    _model = GetJsonModel().callApi();
    resetSelectionTile();
    super.initState();
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
            FutureBuilder<Model>(
                future: _model,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    parsedJson = snapshot.data!.results;
                    options = optionsList(parsedJson, index);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Question ' '${index + 1}',
                          style: questionTextStyle(),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          parsedJson[index].question,
                          style: questionsTextStyle(),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Select any choices',
                          style: selectCoiceTextStyle(),
                        ),
                        parsedJson[index].type == 'multiple'
                            ? Center(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: 350,
                                      height: 300,
                                      child: ListView.builder(
                                        itemCount: options!.length,
                                        itemBuilder: (context, optionsIndex) =>
                                            SizedBox(
                                          height: 60,
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: ListTile(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              tileColor: Colors.grey.shade200,
                                              leading: SizedBox(
                                                  width: 200,
                                                  child: Text(
                                                      options![optionsIndex])),
                                              selected:
                                                  isSelected[optionsIndex],
                                              selectedTileColor:
                                                  Colors.green.shade300,
                                              onTap: () {
                                                setState(() {
                                                  if (optionsIndex == 0) {
                                                    isSelected[0] =
                                                        !isSelected[0];
                                                    isSelected[1] = false;
                                                    isSelected[2] = false;
                                                    isSelected[3] = false;
                                                  }
                                                  if (optionsIndex == 1) {
                                                    isSelected[1] =
                                                        !isSelected[1];
                                                    isSelected[0] = false;
                                                    isSelected[2] = false;
                                                    isSelected[3] = false;
                                                  }
                                                  if (optionsIndex == 2) {
                                                    isSelected[2] =
                                                        !isSelected[2];
                                                    isSelected[0] = false;
                                                    isSelected[1] = false;
                                                    isSelected[3] = false;
                                                  }
                                                  if (optionsIndex == 3) {
                                                    isSelected[3] =
                                                        !isSelected[3];
                                                    isSelected[0] = false;
                                                    isSelected[2] = false;
                                                    isSelected[1] = false;
                                                  }
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : Center(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: 250,
                                      height: 300,
                                      child: ListView.builder(
                                        itemCount: options!.length,
                                        itemBuilder: (context, optionsIndex) =>
                                            Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: ListTile(
                                            tileColor: Colors.grey.shade200,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            leading: SizedBox(
                                                width: 200,
                                                child: Text(
                                                    options![optionsIndex])),
                                            selected: isSelected[optionsIndex],
                                            selectedTileColor:
                                                Colors.green.shade300,
                                            onTap: () {
                                              setState(() {
                                                if (optionsIndex == 0) {
                                                  isSelected[0] =
                                                      !isSelected[0];
                                                  isSelected[1] = false;
                                                }
                                                if (optionsIndex == 1) {
                                                  isSelected[1] =
                                                      !isSelected[1];
                                                  isSelected[0] = false;
                                                }
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    //
                                  ],
                                ),
                              ),
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
                                for (int i = 0; i < isSelected.length; i++) {
                                  if (isSelected[i] == true) {
                                    if (options![i] ==
                                        parsedJson[index].answer) {
                                      score();
                                      break;
                                    }
                                  }
                                }
                                setState(() {
                                  resetSelectionTile();
                                  if (index < 9) {
                                    index += 1;
                                  } else {
                                    getTotalPoint(points);
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ScoreScreen(),
                                      ),
                                    );
                                    index = 0;
                                  }
                                });
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
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ],
        ),
      ),
    );
  }
}
