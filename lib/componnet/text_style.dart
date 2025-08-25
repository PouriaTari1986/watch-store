import 'package:di_state_managment/gen/fonts.gen.dart';
import 'package:di_state_managment/resource/app_colors.dart';
import 'package:flutter/widgets.dart';

class LightAppTextStyle {
  LightAppTextStyle._();

  static const TextStyle title = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 14,
    color: LightAppColors.title,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle selectedTab = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 14,
    color: LightAppColors.title,
    fontWeight: FontWeight.bold,
  );

  static TextStyle unSelectedTab = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 14,
    color: LightAppColors.title.withAlpha(125),
    fontWeight: FontWeight.bold,
  );

  static TextStyle caption = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 13,
    color: LightAppColors.title.withAlpha(150),
    fontWeight: FontWeight.normal,
  );

  static const TextStyle taglistStyle = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 14,
    color: LightAppColors.surfaceColor,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle prodactTitle = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 16,
    color: LightAppColors.title,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle avatar = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 11,
    color: LightAppColors.title,
    fontWeight: FontWeight.w300,
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
    fontWeight: FontWeight.bold,
  );

  static const TextStyle editNumber = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 14,
    color: LightAppColors.editNumber,
    fontWeight: FontWeight.bold,
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

  static const TextStyle discountText = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 12,
    color: LightAppColors.disctontText,
  );

  static const TextStyle wonderTextStyle = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 22,
    color: LightAppColors.wonderText,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle oldPrice = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 15,
    color: LightAppColors.oldProductPrice,
    decoration: TextDecoration.lineThrough,
  );

  static const TextStyle timerStyle = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 15,
    color: LightAppColors.timerText,
  );

  static const TextStyle seeMore = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 13,
    color: LightAppColors.title,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle prodTimerStyle = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 13,
    color: LightAppColors.oldProductPrice,
    fontWeight: FontWeight.w400,
  );
}
