import 'package:flutter/material.dart';
import 'package:project_trivia/controller/questions_view_controller.dart';

class TrueOrFalseQuestionsWidget extends StatefulWidget {
  final QuestionsViewController questionsViewController;

  const TrueOrFalseQuestionsWidget(this.questionsViewController, {Key? key})
      : super(key: key);

  @override
  State<TrueOrFalseQuestionsWidget> createState() =>
      _TrueOrFalseQuestionsWidgetState();
}

class _TrueOrFalseQuestionsWidgetState
    extends State<TrueOrFalseQuestionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            width: 250,
            height: 300,
            child: ListView.builder(
              itemCount: widget.questionsViewController.options!.length,
              itemBuilder: (context, optionsIndex) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListTile(
                  tileColor: Colors.grey.shade200,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  leading: SizedBox(
                      width: 200,
                      child: Text(widget
                          .questionsViewController.options![optionsIndex])),
                  selected:
                      widget.questionsViewController.isSelected[optionsIndex],
                  selectedTileColor: Colors.green.shade300,
                  onTap: () => widget.questionsViewController
                      .setTrueOrFalseSelectedTile(optionsIndex),
                ),
              ),
            ),
          ),
          //
        ],
      ),
    );
  }
}
