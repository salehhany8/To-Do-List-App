import 'package:flutter/material.dart';
import 'package:todo_list_app/core/style/color_manager.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    //useMaterial3: true,

    scaffoldBackgroundColor: ColorManager.white,

    appBarTheme: const AppBarTheme(
      elevation: 0,
      surfaceTintColor: Colors.transparent,
    ),

    datePickerTheme: DatePickerThemeData(
      backgroundColor: ColorManager.white,
      elevation: 5,
      surfaceTintColor:Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: .circular(10)
      ),

      headerBackgroundColor: ColorManager.brandPrimaryColor,
      headerForegroundColor: ColorManager.white,

      dayForegroundColor: WidgetStateColor.resolveWith((states){
        if (states.contains(WidgetState.disabled)){
          return ColorManager.neutralGhostColor;
        }
        if (states.contains(WidgetState.selected)){
          return ColorManager.white;
        }
        return ColorManager.black;
      }),

    dayBackgroundColor: WidgetStateProperty.resolveWith((states){
      if (states.contains(WidgetState.selected)){
        return ColorManager.brandPrimaryColor;
      }
      return null;
    }),

    todayBackgroundColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return ColorManager.brandPrimaryColor;
          }

          return Colors.transparent;
        },
      ),

      todayBorder: BorderSide(
        color: ColorManager.brandPrimaryColor
      ),
      cancelButtonStyle: TextButton.styleFrom(
        foregroundColor: ColorManager.neutralGhostColor
      ),
      confirmButtonStyle: TextButton.styleFrom(
        foregroundColor: ColorManager.brandPrimaryColor
      )

    )

  );


}