import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/core/constants.dart';
import 'package:flutter_quiz_app/core/custom_color.dart';

class AppStyle {
  static ButtonStyle kElevatedButtonStyle() {
    return ButtonStyle(
      padding: WidgetStateProperty.all<EdgeInsets>(kEdgeInsetsVer12),
      foregroundColor: WidgetStateProperty.all<Color>(CustomColor.kWhiteColor),
      backgroundColor: WidgetStateProperty.all<Color>(CustomColor.kPrimaryColor),
      elevation: WidgetStateProperty.all<double>(4.0),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: kBorderRadius10,
        ),
      ),
    );
  }
}
