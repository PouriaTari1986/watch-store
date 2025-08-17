import 'package:di_state_managment/gen/fonts.gen.dart';
import 'package:di_state_managment/resorse/app_colors.dart';
import 'package:flutter/widgets.dart';

class LightAppTextStyle {
  LightAppTextStyle._();

  static const TextStyle title = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 14,
    color: LightAppColors.title,
    fontWeight: FontWeight.bold
  );

  static const TextStyle avatar = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 11,
    color: LightAppColors.title,
    fontWeight: FontWeight.w300
  );

  static const TextStyle hintTitle = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 14,
    color: LightAppColors.hint,
  );

  static const TextStyle elevetedBotton = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 15,
    color: LightAppColors.buttonTextColor,
        fontWeight: FontWeight.bold

  );

  static const TextStyle editNumber = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 14,
    color: LightAppColors.editNumber,
        fontWeight: FontWeight.bold

  );

  static const TextStyle btNavActive = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 12,
    color: LightAppColors.btNavActiveColor,

  );

  static const TextStyle btNavInActive = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 12,
    color: LightAppColors.btNavInActiveColor,

  );
}
