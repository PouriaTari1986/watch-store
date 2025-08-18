import 'package:di_state_managment/componnet/extension.dart';
import 'package:di_state_managment/componnet/text_style.dart';
import 'package:di_state_managment/resorse/app_colors.dart';
import 'package:di_state_managment/resorse/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BtmNAvItems extends StatelessWidget {
  final String iconSvgPath;
  final String text;
  final bool isActive;
  final int? count;
  final VoidCallback onTap;

  const BtmNAvItems({
    super.key,
    this.count,
    required this.iconSvgPath,
    required this.text,
    required this.isActive,
    required this.onTap,
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
              Stack(
                clipBehavior: Clip.none,
                children: [
                  SvgPicture.asset(
                    iconSvgPath,
                    colorFilter: ColorFilter.mode(
                      isActive
                          ? LightAppColors.btNavActiveColor
                          : LightAppColors.btNavInActiveColor,
                      BlendMode.srcIn,
                    ),
                  ),

                  // Badge
                  if (count != null && count! > 0)
                    Positioned(
                      top: -4,
                      right: -6,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 2),
                        decoration: BoxDecoration(
                          color: LightAppColors.discountColor,
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 18,
                          minHeight: 18,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          count.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              Dimens.small.height,
              Text(
                text,
                style: isActive
                    ? LightAppTextStyle.btNavActive
                    : LightAppTextStyle.btNavInActive,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
