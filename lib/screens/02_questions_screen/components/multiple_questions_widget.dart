import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_trivia/controller/questions_view_controller.dart';

class MultipleTypeQuestonsWidget extends StatefulWidget {
  final QuestionsViewController questionsViewController;
  const MultipleTypeQuestonsWidget(this.questionsViewController, {Key? key})
      : super(key: key);

  @override
  State<MultipleTypeQuestonsWidget> createState() =>
      _MultipleTypeQuestonsWidgetState();
}

class _MultipleTypeQuestonsWidgetState
    extends State<MultipleTypeQuestonsWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(child: GetBuilder<QuestionsViewController>(
      builder: (_) {
        return Column(
          children: [
            SizedBox(
              width: 350,
              height: 300,
              child: ListView.builder(
                itemCount: widget.questionsViewController.options!.length,
                itemBuilder: (context, optionsIndex) => SizedBox(
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      tileColor: Colors.grey.shade200,
                      leading: SizedBox(
                        width: 200,
                        child: Text(widget
                            .questionsViewController.options![optionsIndex]),
                      ),
                      selected: widget
                          .questionsViewController.isSelected[optionsIndex],
                      selectedTileColor: Colors.green.shade300,
//onTap
                      onTap: () => widget.questionsViewController
                          .setSelectedOption(optionsIndex),
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    ));
  }
}
