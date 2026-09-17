import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list_app/core/style/color_manager.dart';
import 'package:todo_list_app/core/style/custom_font_weight.dart';
import 'package:todo_list_app/core/utils/units.dart';

class CustomMainButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String btnTitle;
  final String? svgIconPath;
  final IconData? icon;
  final Color? btnColor;
  final double? height;
  final double? width;
  final double? fontSize;
  final Color? textColor;
  final double? borderRadius;

  const CustomMainButton({
    super.key,
    required this.onPressed,
    required this.btnTitle,
    this.svgIconPath,
    this.icon,
    this.btnColor,
    this.height,
    this.width,
    this.fontSize,
    this.textColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .all(10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: Size(
            // width ?? Units.getWidth(context: context, WidgetWidth: 327),
            // height ??  Units.getHeight(context: context, WidgetHeight: 56)
            width ?? 350,
            height ?? 60
          ),
          elevation: 0,
          backgroundColor: btnColor ?? ColorManager.brandPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius ?? 
              //Units.getRadius(context: context, radius: 16)
              16
            ),
          ),
          // padding: .symmetric(
          //   vertical :Units.getHeight(context: context, WidgetHeight: 10),
          //   horizontal: Units.getWidth(context: context, WidgetWidth: 10)
          // ),
          padding: .zero
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (svgIconPath != null) ...[
              SvgPicture.asset(
                // width:width ?? Units.getWidth(context: context, WidgetWidth: 24),
                // height:height ?? Units.getHeight(context: context, WidgetHeight: 24),
                svgIconPath!,
                width: 25,
                height: 25,
              ),
              SizedBox(
                // width: Units.getWidth(context: context, WidgetWidth: 8)
                width: 8,
              ),
            ], 
            Text(
              btnTitle,
              style: TextStyle(
                color: textColor ?? ColorManager.white,
                fontSize: fontSize ?? 19,
                fontWeight: CustomFontWeight.semiBold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
