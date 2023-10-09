import 'package:flutter/material.dart';
import 'package:quiz_app/components/answer_buttons.dart';
import 'package:quiz_app/quizData/questions_list.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionState();
}

class _QuestionState extends State<QuestionScreen> {
  var currentquestionindex = 0;
  void changeIndex() {
    setState(() {
      currentquestionindex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentquestion = questionslist[currentquestionindex];

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(90),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currentquestion.text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center),
            const SizedBox(
              height: 15,
            ),
            //... is spread opreater divide list into indivitual widgets
            ...currentquestion.shuffleAnswers().map(
                  (answers) => AnswerButton(answers, changeIndex),
                ),
          ],
        ),
      ),
    );
  }
}
