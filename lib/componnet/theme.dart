

import 'package:di_state_managment/resorse/app_colors.dart';
import 'package:di_state_managment/resorse/dimens.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme(){

  return ThemeData(
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
    primaryColor: LightAppColors.primaryColor,
    scaffoldBackgroundColor: LightAppColors.scaffoldColor,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: WidgetStateColor.resolveWith((callback){
        if (callback.contains(WidgetState.focused)) {
          return LightAppColors.focusedTextFlied;
        } else {
          return LightAppColors.unfocusedTextFlied;
        }
      }),
      contentPadding: EdgeInsets.all(Dimens.medium),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Dimens.medium),
        borderSide: BorderSide(color: LightAppColors.border)
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Dimens.medium),
        borderSide: BorderSide(color: LightAppColors.borderSelected)
      )
    )
  );
}