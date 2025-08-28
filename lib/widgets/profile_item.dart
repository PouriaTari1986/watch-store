import 'package:di_state_managment/componnet/extension.dart';
import 'package:di_state_managment/componnet/text_style.dart';
import 'package:di_state_managment/resource/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key, required this.iconPath, required this.text});
  final String iconPath;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: LightAppTextStyle.title,
        
          textAlign: TextAlign.right,
        ),
        Dimens.small.width,
        SvgPicture.asset(iconPath),
      ],
    );
  }
}
