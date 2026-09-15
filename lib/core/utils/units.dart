import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Units {
  static const figmaWidth =375;
  static const figmaHeight =812;

  static double getWidth({
    required BuildContext context,
    required double WidgetWidth
  }) => (MediaQuery.of(context).size.width * WidgetWidth)/figmaWidth;

  static double getHeight({
    required BuildContext context,
    required double WidgetHeight
  }) => (MediaQuery.of(context).size.height * WidgetHeight)/figmaHeight;

  static double getVerticalPadding({
    required BuildContext context,
    required double padding,
  }) => getHeight(context: context, WidgetHeight: padding);

  static double getHorizontalPadding({
    required BuildContext context,
    required double padding,
  }) => getWidth(context: context, WidgetWidth: padding);

  static double getRadius({required BuildContext context, required double radius}){
    final Size size = MediaQuery.sizeOf(context);
    final double x = size.width / figmaWidth;
    final double y = size.height / figmaHeight;

    return radius * min(x,y);  
  }


  static double getFontSize({required BuildContext context,required double fontsize}){
    return MediaQuery.of(context).size.width * fontsize /figmaWidth;
  }
}