import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/core/constants.dart';
import 'package:flutter_quiz_app/core/custom_color.dart';
import 'package:flutter_quiz_app/presentation/screens/home/home_page.dart';
import 'package:flutter_quiz_app/presentation/screens/score/widgets/actions_icon.dart';
import 'package:flutter_quiz_app/presentation/screens/score/widgets/status_information.dart';
import 'package:flutter_quiz_app/presentation/screens/score/widgets/your_score.dart';
import 'package:get/get.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({
    super.key,
    required this.correctAnswer,
    required this.wrongAnswer,
    required this.totalQuestions,
  });
  final int correctAnswer;
  final int wrongAnswer;
  final int totalQuestions;

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  bool isLoading = true;
  int totalPoint = 0;
  int remainingQuestion = 0;

  @override
  void initState() {
    calculateScore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: SizedBox(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Stack(
                      children: [
                        Container(
                          height: size.height / 2.6,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: CustomColor.kPrimaryColor,
                            borderRadius: kBorderRadius20,
                          ),
                          child: const YourScore(score: '100'),
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
                              padding: const EdgeInsets.all(18).copyWith(right: 12),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: StatusInfomation(
                                              title: "Completion",
                                              value: "100%",
                                              color: CustomColor.kPrimaryColor,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: SizedBox(),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: StatusInfomation(
                                              title: "Total Questions",
                                              value: "10",
                                              color: CustomColor.kPrimaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: StatusInfomation(
                                              title: "Correct",
                                              value: widget.correctAnswer.toString(),
                                              color: CustomColor.kSuccessColor,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: SizedBox(
                                              child: Center(
                                                child: StatusInfomation(
                                                  title: "Remaining",
                                                  value: remainingQuestion.toString(),
                                                  color: CustomColor.kGreyColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: StatusInfomation(
                                              title: "Wrong",
                                              value: widget.wrongAnswer.toString(),
                                              color: CustomColor.kFailColor,
                                            ),
                                          ),
                                        ],
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
                  flex: 2,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ActionsIcon(
                              text: 'Paly Again',
                              icon: Icons.refresh_rounded,
                              bgColor: CustomColor.kOrangeColor,
                              onTap: () => Get.off(
                                () => const HomePage(),
                                transition: Transition.fade,
                              ),
                            ),
                            ActionsIcon(
                              text: 'Review Answer',
                              icon: Icons.visibility_rounded,
                              bgColor: CustomColor.kMulberryColor,
                              onTap: () {},
                            ),
                            ActionsIcon(
                              text: 'Share Score',
                              icon: Icons.share_rounded,
                              bgColor: CustomColor.kDarkTealColor,
                              onTap: () {},
                            ),
                          ],
                        ),
                        kHeight15,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ActionsIcon(
                              text: 'Generete PDF',
                              icon: Icons.file_open_rounded,
                              bgColor: CustomColor.kViolateColor,
                              onTap: () {},
                            ),
                            ActionsIcon(
                              text: 'Home',
                              icon: Icons.home_rounded,
                              bgColor: CustomColor.kPrimaryColor,
                              onTap: () => Get.off(
                                () => const HomePage(),
                                transition: Transition.fade,
                              ),
                            ),
                            ActionsIcon(
                              text: 'Settings',
                              icon: Icons.settings_rounded,
                              bgColor: CustomColor.kGreyColor,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ],
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

  void calculateScore() {
    int attendedQuestion = widget.correctAnswer + widget.wrongAnswer;
    setState(() {
      remainingQuestion = widget.totalQuestions - attendedQuestion;
    });
  }
}
