import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mansoor/Quiz/question_page.dart';
import 'package:slide_countdown/slide_countdown.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
            setState(() {});
          },
          child: Icon(
            Icons.navigate_before,
            color: Colors.black54,
          ),
        ),
        title: const SlideCountdown(
          duration: defaultDuration,
          padding: defaultPadding,
        ),
        centerTitle: true,
        actions: [
          FlatButton(
              onPressed: () {
                Fluttertoast.showToast(
                    msg: "Select any Option...", timeInSecForIosWeb: 3);
              },
              child: Text('Skip'))
        ],
      ),
      body: const QuestionPage(),
    );
  }
}
