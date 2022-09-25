import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mansoor/Parents/process_page.dart';
import 'package:mansoor/Quiz/question_model.dart';
import 'package:mansoor/Quiz/question_controller.dart';
import 'package:mansoor/Quiz/score_page.dart';
import 'package:slide_countdown/slide_countdown.dart';

const defaultDuration = Duration(minutes: 5, seconds: 0);
const defaultPadding = EdgeInsets.symmetric(horizontal: 10, vertical: 5);

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  void initState() {
    // TODO: implement initState
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(
      QuestionController(),
    );

    final Question question;

    bool isLastQuestion = true;
    if (_controller.questionNumber == _controller.questions.length) {
      isLastQuestion = false;
    }

    return Stack(
      children: <Widget>[
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black54,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GetBuilder<QuestionController>(
                    init: QuestionController(),
                    builder: (context) {
                      return Stack(
                        children: <Widget>[
                          LayoutBuilder(
                            builder: (context, constraints) => Container(
                              width: constraints.maxWidth *
                                  _controller.animation.value,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                    colors: [
                                      Colors.green,
                                      Colors.red,
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "${(_controller.animation.value * 60).round()} sec",
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Icon(Icons.lock_clock),
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Obx(
                  () => Text.rich(
                    TextSpan(
                      text: "Question ${_controller.questionNumber.value}",
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Colors.black54),
                      children: [
                        TextSpan(
                          text: "/${_controller.questions.length}",
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(
                thickness: 1.5,
              ),
              const SizedBox(
                height: 12,
              ),
              Expanded(
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _controller.pagecontroller,
                  onPageChanged: _controller.updateQuestionNumber,
                  itemCount: _controller.questions.length,
                  itemBuilder: (context, index) => QuestionCard(
                    question: _controller.questions[index],
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 30),
              //   child: ElevatedButton(
              //     onPressed: () => {
              //       isLastQuestion
              //           ? (question, index) => {
              //                 // _controller.checkAnswer(question, index),
              //                 _controller.nextQuestion()
              //               }
              //           : () => {
              //                 Navigator.push(
              //                   context,
              //                   MaterialPageRoute(
              //                     builder: (context) => ScorePage(),
              //                   ),
              //                 ),
              //                 // if (ProcessPage.QuizesTaken >= 10)
              //                 //   {ProcessPage.QuizesTaken++}
              //                 // _controller.isAnswered == false,
              //                 // _controller.animation.reactive,
              //                 // Get.reset(),
              //                 // _controller.animation.reactive,
              //                 // _controller.pagecontroller.initialPage
              //               },
              //       setState(() {}),
              //     },
              //     child: Text(isLastQuestion ? "Next" : "Submit"),
              //   ),
              // )
            ],
          ),
        )
      ],
    );
  }
}

class QuestionCard extends StatefulWidget {
  final Question question;

  QuestionCard({Key? key, required this.question}) : super(key: key);

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  var optionIndex;

  var questionSelected;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.black54),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            Text(
              widget.question.question,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.black54),
            ),
            SizedBox(
              height: 12,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.question.options.length,
              itemBuilder: (BuildContext context, index) {
                return InkWell(
                  onTap: () {
                    // widget.question.selectedoption ==
                    //     widget.question.options[index];
                    // setState(() {
                    //   _controller.correctAnswer == widget.question.answer;
                    // });
                    // questionSelected = question.options[index];
                    // optionIndex = index;
                    _controller.checkAnswer(widget.question, index);
                    // _controller.isAnswered == true;
                  },
                  child: Option(
                    text: widget.question.options[index],
                    index: index,
                    //press: () => _controller.checkAnswer(question, index)
                  ),
                );
              },
            ),
            // ...List.generate(
            //   question.options.length,
            //   (index) => Option(
            //     index: index,
            //     text: question.options[index],
            //     press: () => _controller.checkAnswer(question, index),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class Option extends StatelessWidget {
  final String text;
  final int index;

  //final VoidCallback press;

  const Option({
    Key? key,
    required this.text,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
      init: QuestionController(),
      builder: (controller) {
        return InkWell(
          //onTap: press,
          child: Container(
            margin: EdgeInsets.only(top: 12),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: getColor(controller, index)),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(
                    "${index + 1}: $text",
                    style: TextStyle(
                      color: getColor(controller, index),
                      fontSize: 16,
                    ),
                    maxLines: 3,
                  ),
                ),
                Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    color: getColor(controller, index) == Colors.grey
                        ? Colors.transparent
                        : getColor(controller, index),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: getColor(controller, index),
                    ),
                  ),
                  child: getColor(controller, index) == Colors.grey
                      ? null
                      : Icon(
                          getIcon(controller, index),
                          size: 16,
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Color getColor(QuestionController controller, int index) {
  if (controller.isAnswered) {
    if (index == controller.correctAnswer) {
      return Colors.green;
    } else if (index == controller.selectedAnswer &&
        controller.selectedAnswer != controller.correctAnswer) {
      return Colors.red;
    }
  }
  return Colors.grey;
}

IconData getIcon(QuestionController controller, int index) {
  return getColor(controller, index) == Colors.red ? Icons.close : Icons.done;
}
