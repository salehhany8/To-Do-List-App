import 'package:flutter/material.dart';
import 'package:todo_list_app/core/style/color_manager.dart';
import 'package:todo_list_app/core/style/custom_font_weight.dart';

class TextStyles {
  static const TextStyle splashText = TextStyle(
    fontWeight: CustomFontWeight.bold,
    color: ColorManager.brandPrimaryBackgroundColor,
    fontSize: 26
  );

  static const TextStyle splashTextS = TextStyle(
    fontWeight: CustomFontWeight.regular,
    color: ColorManager.brandPrimaryBackgroundColor,
    fontSize: 14
  );

  static const TextStyle textStyleGreyR14 = TextStyle(
    fontWeight: CustomFontWeight.regular,
    color: ColorManager.neutralSecondaryColor,
    fontSize: 14
  );

  static const TextStyle BlackB16 = TextStyle(
    fontWeight: CustomFontWeight.bold,
    color: ColorManager.black,
    fontSize: 16
  );

  static const TextStyle BlackR16 = TextStyle(
    fontWeight: CustomFontWeight.regular,
    color: ColorManager.black,
    fontSize: 16
  );

  static const TextStyle BlackB26 = TextStyle(
    fontWeight: CustomFontWeight.bold,
    color: ColorManager.black,
    fontSize: 26
  );

  static const TextStyle BlackM26 = TextStyle(
    fontWeight: CustomFontWeight.medium,
    color: ColorManager.black,
    fontSize: 26
  );

  static const TextStyle BlackB28 = TextStyle(
    wordSpacing: 1,
    fontWeight: CustomFontWeight.bold,
    color: ColorManager.black,
    fontSize: 28
  );

  static const TextStyle BlackM28 = TextStyle(
    wordSpacing: 1,
    fontWeight: CustomFontWeight.medium,
    color: ColorManager.black,
    fontSize: 28
  );

  static const TextStyle todyStyle = TextStyle(
    fontWeight: CustomFontWeight.medium,
    color: ColorManager.brandPrimaryColor,
    fontSize: 26
  );

}


