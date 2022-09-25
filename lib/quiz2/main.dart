import 'package:flutter/material.dart';
import 'package:mansoor/quiz2/Model/Question.dart';
import 'package:mansoor/quiz2/Quiz/quiz_screen.dart';

class Quiz extends StatelessWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: const Text(
            "Quiz",
            style: TextStyle(
              color: Colors.orange,
              fontSize: 30,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewQuizScreen(
                  quizQuestions: quizQuestions,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
