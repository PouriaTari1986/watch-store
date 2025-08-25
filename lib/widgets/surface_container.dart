import 'package:di_state_managment/resource/app_colors.dart';
import 'package:di_state_managment/resource/dimens.dart';
import 'package:flutter/material.dart';

class SurfaceContainer extends StatelessWidget {
  const SurfaceContainer({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        Dimens.medium,
        Dimens.medium,
        Dimens.medium,
        0,
      ),
      padding: EdgeInsets.all(Dimens.medium),
      width: double.infinity,
      decoration: BoxDecoration(
        color: LightAppColors.surfaceColor,
        borderRadius: BorderRadius.circular(Dimens.medium),
      ),
      child: child,
    );
  }
}
