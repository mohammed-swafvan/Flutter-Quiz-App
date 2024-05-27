import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/core/app_style.dart';
import 'package:flutter_quiz_app/core/constants.dart';
import 'package:flutter_quiz_app/core/custom_color.dart';
import 'package:flutter_quiz_app/infastructure/quiz/quiz_repository.dart';
import 'package:flutter_quiz_app/presentation/screens/home/widgets/options_widget.dart';
import 'package:flutter_quiz_app/presentation/screens/score/score_screen.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data = [];
  int questionNum = 0;
  List<String> shuffledOptions = [];
  bool isLoading = true;
  String errorMessage = '';
  late Timer timer;
  int secondReminder = 20;
  int countOfCorrectAnswer = 0;
  int countOfWrongAnswer = 0;
  String? selectedOption;

  @override
  void initState() {
    clearAll();
    getQuizQuestionAnwer();
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    clearAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: CustomColor.kPrimaryColor,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 5,
                        child: SizedBox(
                          width: double.maxFinite,
                          child: Stack(
                            children: [
                              Container(
                                height: size.height / 3.4,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color: CustomColor.kPrimaryColor,
                                  borderRadius: kBorderRadius20,
                                ),
                                child: Center(
                                  child: Container(
                                    width: size.width * 0.16,
                                    height: size.width * 0.16,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Get.isDarkMode ? CustomColor.kBlackColor : CustomColor.kWhiteColor,
                                    ),
                                    child: Center(
                                      child: Text(
                                        secondReminder.toString(),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: CustomColor.kPrimaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: (size.width - (size.width * 0.9)) / 3.3,
                                child: Container(
                                  height: size.height / 4.2,
                                  width: size.width * 0.9,
                                  decoration: BoxDecoration(
                                    color: Get.isDarkMode ? CustomColor.kBlackColor : CustomColor.kWhiteColor,
                                    borderRadius: kBorderRadius20,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: const Offset(0, 1),
                                        blurRadius: 5,
                                        spreadRadius: 3,
                                        color: CustomColor.kShadowColor,
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: kEdgeInsetsHor18.copyWith(top: 4),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              data[questionNum]['difficulty'],
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: data[questionNum]['difficulty'] == 'easy'
                                                    ? CustomColor.kSuccessColor
                                                    : data[questionNum]['difficulty'] == 'medium'
                                                        ? CustomColor.kOrangeColor
                                                        : CustomColor.kFailColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'Question ${questionNum + 1}/${data.length}',
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: CustomColor.kPrimaryColor,
                                          ),
                                        ),
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                              data.isNotEmpty ? data[questionNum]['question'] : 'No Question Availabel now',
                                              style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: data.isNotEmpty && shuffledOptions.isNotEmpty && data[questionNum]['incorrect_answers'] != null
                            ? Center(
                                child: SingleChildScrollView(
                                  child: Wrap(
                                    spacing: 4,
                                    runSpacing: 4,
                                    children: shuffledOptions.map((option) {
                                      bool isCorrect = option == data[questionNum]['correct_answer'];
                                      return OptionWidget(
                                        option: option,
                                        onTap: () => timer.isActive ? submitAnswer(option) : null,
                                        isSelected: selectedOption != null,
                                        isWrong: option != data[questionNum]['correct_answer'],
                                        isCorrect: isCorrect,
                                      );
                                    }).toList(),
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      ),
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: SizedBox(
                            width: size.width * 0.9,
                            child: ElevatedButton(
                              onPressed: () {
                                nextQuestion();
                              },
                              style: AppStyle.kElevatedButtonStyle(),
                              child: const Text(
                                'Next',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  getQuizQuestionAnwer() async {
    try {
      List responseData = await QuizRepository.getQuizQuestionAnwer();
      setState(() {
        data = responseData;
        updateShuffleOptions();
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = "Failed to load quiz questions. Please try again later.";
        isLoading = false;
      });
    }
  }

  void updateShuffleOptions() {
    setState(() {
      shuffledOptions = shuffleOptions([
        data[questionNum]['correct_answer'],
        ...data[questionNum]['incorrect_answers'],
      ]);
    });
  }

  List<String> shuffleOptions(List<String> options) {
    List<String> shuffledOptions = List.from(options);
    shuffledOptions.shuffle();
    return shuffledOptions;
  }

  nextQuestion() {
    if (questionNum < 9) {
      setState(() {
        questionNum++;
        updateShuffleOptions();
        secondReminder = 20;
      });
    } else {
      timer.cancel();
      Get.to(
        () => ScorePage(
          correctAnswer: countOfCorrectAnswer,
          wrongAnswer: countOfWrongAnswer,
          totalQuestions: data.length,
        ),
        transition: Transition.fadeIn,
      );
    }
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (secondReminder > 0) {
          secondReminder--;
        } else {
          secondReminder = 20;
          nextQuestion();
        }
      });
    });
  }

  void submitAnswer(String option) {
    timer.cancel();
    setState(() {
      String correctAnswer = data[questionNum]['correct_answer'];
      selectedOption = option;
      if (correctAnswer == option) {
        countOfCorrectAnswer++;
      } else {
        countOfWrongAnswer++;
      }
    });
    Future.delayed(const Duration(seconds: 2), () {
      selectedOption = null;
      startTimer();
      nextQuestion();
    });
  }

  void clearAll() {
    setState(() {
      data = [];
      questionNum = 0;
      shuffledOptions = [];
      isLoading = true;
      errorMessage = '';
      secondReminder = 20;
      countOfCorrectAnswer = 0;
      countOfWrongAnswer = 0;
      selectedOption = null;
    });
  }
}
