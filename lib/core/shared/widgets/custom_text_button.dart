import 'package:flutter/material.dart';
import 'package:todo_list_app/core/style/color_manager.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String btnTitle;
  final double? fontsize;
  final Color? btnColor;
  final FontWeight? fontWeight;

   const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.btnTitle,
    this.fontsize,
    this.btnColor,
    this.fontWeight,
  });
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed, 
      
      child:  Text(
        btnTitle,
        style: TextStyle(
          color: btnColor ?? ColorManager.brandPrimaryColor,
          fontSize: fontsize ?? 16,
          fontWeight: fontWeight ?? .w500,
      ),
      )
        
      );
  }
}