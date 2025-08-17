import 'package:di_state_managment/componnet/extension.dart';
import 'package:di_state_managment/gen/assets.gen.dart';
import 'package:di_state_managment/resorse/app_colors.dart';
import 'package:di_state_managment/resorse/dimens.dart';
import 'package:di_state_managment/resorse/strings.dart';
import 'package:di_state_managment/widgets/app_slider.dart';
import 'package:di_state_managment/widgets/cat_widget.dart';
import 'package:di_state_managment/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchBtn(onTap: () {}),
              AppSlider(imgList: []),
              //cat
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CatWidget(
                    color: LightAppColors.catTableAiColor,
                    iconPath: Assets.png.table,
                    title: AppStrings.tableWatch,
                    onTap: () {},
                  ),

                  CatWidget(
                    color: LightAppColors.catDigitalAiColor,
                    iconPath: Assets.png.digital,
                    title: AppStrings.digital,
                    onTap: () {},
                  ),
                  CatWidget(
                    color: LightAppColors.catAiColor,
                    iconPath: Assets.png.aiW,
                    title: AppStrings.ai,
                    onTap: () {},
                  ),
                  CatWidget(
                    color: LightAppColors.catClassicColor,
                    iconPath: Assets.png.classicW,
                    title: AppStrings.classic,
                    onTap: () {},
                  ),
                ],
              ),
              Dimens.large.height,
            ],
          ),
        ),
      ),
    );
  }
}
