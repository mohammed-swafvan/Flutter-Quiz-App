import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/core/app_style.dart';
import 'package:flutter_quiz_app/core/constants.dart';
import 'package:flutter_quiz_app/core/custom_color.dart';
import 'package:flutter_quiz_app/presentation/screens/home/widgets/options_widget.dart';
import 'package:flutter_quiz_app/presentation/screens/score/score_screen.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                              padding: const EdgeInsets.all(18),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Get.isDarkMode ? CustomColor.kBlackColor : CustomColor.kWhiteColor,
                              ),
                              child: const Text(
                                '18',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: CustomColor.kPrimaryColor,
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
                            child: const Padding(
                              padding: kEdgeInsetsHor18,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '05',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: CustomColor.kSuccessColor,
                                        ),
                                      ),
                                      Text(
                                        '07',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: CustomColor.kFailColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Question 3/10',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: CustomColor.kPrimaryColor,
                                    ),
                                  ),
                                  kHeight10,
                                  Text('What is Computer?'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Expanded(
                  flex: 3,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: OptionWidget(option: "Option A"),
                            ),
                            kWidth4,
                            Expanded(
                              child: OptionWidget(option: "Option B"),
                            ),
                          ],
                        ),
                        kHeight4,
                        Row(
                          children: [
                            Expanded(
                              child: OptionWidget(option: "Option C"),
                            ),
                            kWidth4,
                            Expanded(
                              child: OptionWidget(option: "Option D"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: SizedBox(
                      width: size.width * 0.9,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(
                            () => const ScorePage(),
                            transition: Transition.fadeIn,
                          );
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
}
