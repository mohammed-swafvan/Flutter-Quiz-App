import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/core/custom_color.dart';
import 'package:get/get.dart';

class YourScore extends StatelessWidget {
  const YourScore({super.key, required this.score});
  final String score;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: size.width / 2.2,
        width: size.width / 2.2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Get.isDarkMode ? CustomColor.kBlackColor.withOpacity(0.2) : CustomColor.kWhiteColor.withOpacity(0.2),
        ),
        child: Center(
          child: Container(
            height: size.width / 2.6,
            width: size.width / 2.6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Get.isDarkMode ? CustomColor.kBlackColor.withOpacity(0.4) : CustomColor.kWhiteColor.withOpacity(0.4),
            ),
            child: Center(
              child: Container(
                height: size.width / 3.2,
                width: size.width / 3.2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Get.isDarkMode ? CustomColor.kBlackColor : CustomColor.kWhiteColor,
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Your Score',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: CustomColor.kPrimaryColor,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: score,
                          style: const TextStyle(
                            fontSize: 18,
                            color: CustomColor.kPrimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                          children: const [
                            TextSpan(
                              text: 'pt',
                              style: TextStyle(
                                fontSize: 14,
                                color: CustomColor.kPrimaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
