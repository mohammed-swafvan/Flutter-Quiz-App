import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/core/constants.dart';
import 'package:flutter_quiz_app/core/custom_color.dart';
import 'package:flutter_quiz_app/presentation/screens/score/widgets/actions_icon.dart';
import 'package:flutter_quiz_app/presentation/screens/score/widgets/status_information.dart';
import 'package:flutter_quiz_app/presentation/screens/score/widgets/your_score.dart';
import 'package:get/get.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({super.key});

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
                              child: const Column(
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
                                              value: "07",
                                              color: CustomColor.kSuccessColor,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: SizedBox(),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: StatusInfomation(
                                              title: "Wrong",
                                              value: "03",
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
                              onTap: () {},
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
                              onTap: () => Navigator.of(context).pop(),
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
}
