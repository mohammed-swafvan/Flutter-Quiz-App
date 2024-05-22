import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/core/constants.dart';
import 'package:flutter_quiz_app/core/custom_color.dart';

class OptionWidget extends StatelessWidget {
  const OptionWidget({super.key, required this.option});
  final String option;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark ? CustomColor.kBlackColor : CustomColor.kWhiteColor,
          borderRadius: kBorderRadius10,
          border: Border.all(
            width: 2,
            color: CustomColor.kShadowColor,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(option, style: const TextStyle(fontWeight: FontWeight.w600)),
          Radio(
            value: option,
            groupValue: 2,
            onChanged: (val) {},
          ),
        ],
      ),
    );
  }
}
