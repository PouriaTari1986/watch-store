import 'package:di_state_managment/resource/app_colors.dart';
import 'package:di_state_managment/resource/dimens.dart';
import 'package:flutter/material.dart';

class AppButtonStyle {
  AppButtonStyle._();

  static ButtonStyle mainButtonStyle = ButtonStyle(
    backgroundColor: WidgetStateColor.resolveWith((callback) {
      if (callback.contains(WidgetState.pressed)) {
        return const Color.fromARGB(255, 47, 100, 165);
      } else {
        return LightAppColors.primaryColor;
      }
    }),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(Dimens.medium),
      ),
    ),
  );
}

class AppButtonStyleRed {
  AppButtonStyleRed._();

  static ButtonStyle mainButtonStyle = ButtonStyle(
    backgroundColor: WidgetStateColor.resolveWith((callback) {
      if (callback.contains(WidgetState.pressed)) {
        return Color.fromARGB(255, 100, 7, 17);
      } else {
        return const Color.fromARGB(255, 190, 7, 22);
      }
    }),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(Dimens.medium),
      ),
    ),
  );
}
