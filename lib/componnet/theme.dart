import 'package:di_state_managment/resource/app_colors.dart';
import 'package:di_state_managment/resource/dimens.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(backgroundColor: WidgetStateProperty.resolveWith((callback){
        if (callback.contains(WidgetState.pressed)) {
          return LightAppColors.buttonColor;
        } else{
          return LightAppColors.wonderText;
        }
      }))
    ),
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
    primaryColor: LightAppColors.primaryColor,
    scaffoldBackgroundColor: LightAppColors.scaffoldColor,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: WidgetStateColor.resolveWith((callback) {
        if (callback.contains(WidgetState.focused)) {
          return LightAppColors.focusedTextFlied;
        } else {
          return LightAppColors.unfocusedTextFlied;
        }
      }),
      contentPadding: EdgeInsets.all(Dimens.medium),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Dimens.medium),
        borderSide: BorderSide(color: LightAppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Dimens.medium),
        borderSide: BorderSide(color: LightAppColors.borderSelected),
      ),
    ),
  );
}
