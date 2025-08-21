

import 'package:di_state_managment/resorse/app_colors.dart';
import 'package:di_state_managment/resorse/dimens.dart';
import 'package:flutter/material.dart';

class ProfileDecoration extends StatelessWidget {
  const ProfileDecoration({super.key,required this.child});
final child;
  @override
  Widget build(BuildContext context) {
   var size = MediaQuery.sizeOf(context);
    return Container(
      width: double.infinity,
      height: size.height/5.4,
      decoration: BoxDecoration(
        color: LightAppColors.surfaceColor,
        borderRadius: BorderRadius.circular(Dimens.medium),
        boxShadow: [
          BoxShadow(
            color: LightAppColors.shadowColor,
            blurRadius: 2,
            offset: Offset(1, 1)
          )
        ]
      ),
      child: child,
    );
  }
}
class ProfileAddDecoration extends StatelessWidget {
  const ProfileAddDecoration({super.key,required this.child});
final child;
  @override
  Widget build(BuildContext context) {
   var size = MediaQuery.sizeOf(context);
    return Container(
      width: double.infinity,
      height: size.height/7.6,
      decoration: BoxDecoration(
        color: LightAppColors.surfaceColor,
        borderRadius: BorderRadius.circular(Dimens.small),
      
      ),
      child: child,
    );
  }
}