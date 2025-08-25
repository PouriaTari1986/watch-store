import 'package:di_state_managment/componnet/text_style.dart';
import 'package:di_state_managment/gen/assets.gen.dart';
import 'package:di_state_managment/resource/app_colors.dart';
import 'package:di_state_managment/resource/dimens.dart';
import 'package:di_state_managment/resource/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchBtn extends StatelessWidget {
  const SearchBtn({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.medium),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: LightAppColors.searchBar,
            borderRadius: BorderRadius.circular(60),

            boxShadow: [
              BoxShadow(
                color: LightAppColors.shadowColor,
                blurRadius: 3,
                offset: Offset(0, 3),
              ),
            ],
          ),
          height: 52,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset(Assets.svg.searchNormal),

              Text(AppStrings.searchPr, style: LightAppTextStyle.hintTitle),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(Assets.png.whatchStore.path),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
