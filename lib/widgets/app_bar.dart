import 'package:di_state_managment/resorse/app_colors.dart';
import 'package:di_state_managment/resorse/dimens.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize{
 

  const CustomAppBar({super.key,required this.child});
@override
final Widget child;
  @override
  Widget build(BuildContext context) {
    return PreferredSize(preferredSize: preferredSize, child: Container(
      height: preferredSize.height,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(Dimens.medium),
        bottomRight: Radius.circular(Dimens.medium),
        ),
        color: LightAppColors.appBar,
        boxShadow: [
          BoxShadow(
            
            color: LightAppColors.shadowColor,
            offset: Offset(0, 2),
            blurRadius: 3
          )
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.medium),
        child: child,
      ),
    ));
  }
  

  
  @override
  
  Size get preferredSize => const Size.fromHeight(50);

}