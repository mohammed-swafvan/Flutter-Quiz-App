import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/core/constants.dart';
import 'package:flutter_quiz_app/core/custom_color.dart';
import 'package:get/get.dart';

class ActionsIcon extends StatelessWidget {
  const ActionsIcon({
    super.key,
    required this.text,
    required this.icon,
    required this.bgColor,
    required this.onTap,
  });

  final String text;
  final IconData icon;
  final Color bgColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: size.width / 6,
            width: size.width / 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: bgColor,
            ),
            child: Icon(
              icon,
              size: 32,
              color: Get.isDarkMode ? CustomColor.kBlackColor : CustomColor.kWhiteColor,
            ),
          ),
        ),
        kHeight4,
        Text(
          text,
          style: const TextStyle(fontSize: 11),
        )
      ],
    );
  }
}
