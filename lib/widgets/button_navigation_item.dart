import 'package:di_state_managment/componnet/extension.dart';
import 'package:di_state_managment/componnet/text_style.dart';
import 'package:di_state_managment/resorse/app_colors.dart';
import 'package:di_state_managment/resorse/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class BtmNAvItems extends StatelessWidget {
final  String iconSvgPath;
final  String text;
final  bool isActive;
final  void Function()onTap;
  const BtmNAvItems({super.key, 
    required this.iconSvgPath,
    required this.text,
    required this.isActive,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: LightAppColors.btNavColor,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconSvgPath,
                colorFilter: ColorFilter.mode(isActive?
                  LightAppColors.btNavActiveColor: LightAppColors.btNavInActiveColor,
                  BlendMode.srcIn,
                ),
              ),
              Dimens.small.height,
              Text(text,
               style:isActive? LightAppTextStyle.btNavActive:LightAppTextStyle.btNavInActive),
            ],
          ),
        ),
      ),
    );
  }
}