


import 'package:di_state_managment/componnet/extension.dart';
import 'package:di_state_managment/componnet/text_style.dart';
import 'package:di_state_managment/gen/assets.gen.dart';
import 'package:di_state_managment/resource/dimens.dart';
import 'package:di_state_managment/resource/strings.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key,required this.onTap,required this.file});
final onTap;
final file;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            width: size.width*.3,
            height: size.width*.3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(1000),
              child: file ==null ?  Image.asset(Assets.png.user.path):Image.file(file),
            ),
          ),
          Dimens.medium.height,
          Text(AppStrings.choosePic,style: LightAppTextStyle.avatar,)
        ],
      ),
    );
  }
}