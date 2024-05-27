import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/core/constants.dart';
import 'package:flutter_quiz_app/core/custom_color.dart';

class OptionWidget extends StatelessWidget {
  const OptionWidget({
    super.key,
    required this.option,
    required this.onTap,
    required this.isSelected,
    required this.isWrong,
    required this.isCorrect,
  });
  final String option;
  final VoidCallback onTap;
  final bool isSelected;
  final bool isWrong;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    Color bgColor;

    if (isSelected) {
      bgColor = isCorrect ? CustomColor.kSuccessColor.withOpacity(0.4) : CustomColor.kFailColor.withOpacity(0.4);
    } else {
      bgColor = Theme.of(context).brightness == Brightness.dark ? CustomColor.kBlackColor : CustomColor.kWhiteColor;
    }

    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.width / 2.2,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: kBorderRadius10,
            border: Border.all(
              width: 2,
              color: CustomColor.kShadowColor,
            )),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  option,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
