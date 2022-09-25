import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:mansoor/quiz2/Components/option_button.dart';
import 'package:mansoor/quiz2/Model/Question.dart';
import 'package:mansoor/quiz2/Result/result_page.dart';

class NewQuizScreen extends StatefulWidget {
  final List<Question> quizQuestions;
  NewQuizScreen({
    required this.quizQuestions,
  });
  @override
  _NewQuizScreenState createState() => _NewQuizScreenState();
}

enum Option { first, second, third, fourth }

class _NewQuizScreenState extends State<NewQuizScreen> {
  int index = 0;
  int correctAns = 0;
  int falseAns = 0;
  String selectedOption = "";
  bool visible = false;
  Option? option;
  int endTime = 0;

  @override
  void initState() {
    super.initState();
    endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 100;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Exit'),
                  content:
                      const Text('Are you sure you want to quit the quiz?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('No'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: const Text('Yes'),
                    ),
                  ],
                ),
              );
            },
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: CountdownTimer(
            endTime: endTime,
            onEnd: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    falseAns: falseAns,
                    totalQuestions: widget.quizQuestions.length,
                    trueAns: correctAns,
                  ),
                ),
              );
            },
            textStyle: TextStyle(
              color: Colors.white,
              shadows: <Shadow>[
                Shadow(
                  color: Colors.red,
                  offset: Offset(3.0, 3.0),
                  blurRadius: 10,
                ),
                // Shadow(
                //   color: Colors.red,
                //   offset: Offset(-3.0, -3.0),
                //   blurRadius: 10,
                // )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.black87),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 25,
                      horizontal: 30,
                    ),
                    width: double.infinity,
                    height: 200,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      child: Text(
                        widget.quizQuestions[index].title.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  OptionButton(
                    color:
                        option == Option.first ? Colors.blue : Colors.blue[200],
                    option: widget.quizQuestions[index].option1.toString(),
                    onTap: () {
                      setState(
                        () {
                          option = Option.first;
                          selectedOption =
                              widget.quizQuestions[index].option1.toString();
                          visible = true;
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  OptionButton(
                    color: option == Option.second
                        ? Colors.blue
                        : Colors.blue[200],
                    option: widget.quizQuestions[index].option2.toString(),
                    onTap: () {
                      setState(
                        () {
                          option = Option.second;
                          selectedOption =
                              widget.quizQuestions[index].option2.toString();
                          visible = true;
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  OptionButton(
                    color:
                        option == Option.third ? Colors.blue : Colors.blue[200],
                    option: widget.quizQuestions[index].option3.toString(),
                    onTap: () {
                      setState(
                        () {
                          option = Option.third;
                          selectedOption =
                              widget.quizQuestions[index].option3.toString();
                          visible = true;
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  OptionButton(
                    color: option == Option.fourth
                        ? Colors.blue
                        : Colors.blue[200],
                    option: widget.quizQuestions[index].option4.toString(),
                    onTap: () {
                      setState(
                        () {
                          option = Option.fourth;
                          selectedOption =
                              widget.quizQuestions[index].option4.toString();
                          visible = true;
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Visibility(
                    visible: visible,
                    child: GestureDetector(
                      onTap: () {
                        if (index == widget.quizQuestions.length - 1) {
                          if (selectedOption ==
                              widget.quizQuestions[index].answer.toString()) {
                            correctAns++;
                          } else {
                            falseAns++;
                          }
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultPage(
                                falseAns: falseAns,
                                totalQuestions: widget.quizQuestions.length,
                                trueAns: correctAns,
                              ),
                            ),
                          );
                        }
                        if (index < widget.quizQuestions.length - 1) {
                          if (selectedOption ==
                              widget.quizQuestions[index].answer.toString()) {
                            correctAns++;
                          } else {
                            falseAns++;
                          }
                          setState(
                            () {
                              index++;
                              visible = false;
                              option = null;
                            },
                          );
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Text(
                          "Next",
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: "Courgette",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
