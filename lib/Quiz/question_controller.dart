import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mansoor/Parents/process_page.dart';
import 'package:mansoor/Quiz/question_model.dart';
import 'package:mansoor/Quiz/score_page.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  String? _userName;

  String get userName => _userName!;

  set userName(String Name) {
    _userName = Name;
  }

  late AnimationController _animationController;
  late Animation _animation;

  Animation get animation => _animation;

  late PageController _pageController;

  PageController get pagecontroller => _pageController;

  bool _isAnswered = false;

  bool get isAnswered => _isAnswered;

  late int _correctAnswer;

  int get correctAnswer => _correctAnswer;

  late int _selectedAnswer;

  int get selectedAnswer => _selectedAnswer;

  final RxInt _questionNumber = 1.obs;

  RxInt get questionNumber => _questionNumber;

  late int _numberOfCorrectAnswer = 0;

  int get numberOfCorrectAnswer => _numberOfCorrectAnswer;

  late int _numberOfInorrectAnswer = 0;

  int get numberOfIncorrectAnswer => _numberOfInorrectAnswer;

  static int ChapterIndex = 0;

  final List<Question> _questions = questionList
      .map((q) => Question(
            chapter: q['chapter'],
            id: q['id'],
            question: q['question'],
            options: q['options'],
            answer: q['correct_answer'],
          ))
      .toList();

  List<Question> get questions =>
      _questions.where((element) => element.chapter == ChapterIndex).toList();

  @override
  void onInit() {
    _animationController =
        AnimationController(duration: const Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });
    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  checkAnswer(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAnswer = question.answer;
    _selectedAnswer = selectedIndex;

    if (_correctAnswer == _selectedAnswer) {
      _numberOfCorrectAnswer++;
    } else {
      _numberOfInorrectAnswer++;
    }

    _animationController.stop();
    update();

    Future.delayed(const Duration(seconds: 1), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      print('length: ' + _questions.length.toString());
      _isAnswered = false;
      _pageController.nextPage(
          duration: const Duration(microseconds: 250), curve: Curves.ease);
      _animationController.reset();
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      Get.to(() => const ScorePage()
          // () {

          // if (ProcessPage.QuizesTaken >= 5) {
          //   ProcessPage.QuizesTaken++;
          // }
          // },
          );

      // _isAnswered = false;

      // _animationController.reset();

      // _animationController.forward().whenComplete(nextQuestion);
    }
  }

  void updateQuestionNumber(int index) {
    _questionNumber.value = index + 1;
  }
}
