import 'package:di_state_managment/componnet/extension.dart';
import 'package:di_state_managment/componnet/text_style.dart';
import 'package:di_state_managment/gen/assets.gen.dart';
import 'package:di_state_managment/resource/app_colors.dart';
import 'package:di_state_managment/resource/dimens.dart';
import 'package:di_state_managment/resource/strings.dart';
import 'package:di_state_managment/widgets/app_slider.dart';
import 'package:di_state_managment/widgets/cat_widget.dart';
import 'package:di_state_managment/widgets/product_items.dart';
import 'package:di_state_managment/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
              SizedBox(
                height: 300,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 300,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: ClampingScrollPhysics(),
                          itemCount: 8,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => ProductItem(productName: "productName", price: int,),
                        ),
                      ),
                     VerticalText(amazeText: AppStrings.wonder,)
                    ],
                  ),
                ),
              ),
              Dimens.large.height,
              SizedBox(
                height: 300,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 300,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: ClampingScrollPhysics(),
                          itemCount: 8,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => ProductItem(productName: "productName", price: int,),
                        ),
                      ),
                     VerticalText(amazeText: AppStrings.bestSelled,)
                    ],
                  ),
                ),
              ),
              Dimens.large.height,
              SizedBox(
                height: 300,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 300,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: ClampingScrollPhysics(),
                          itemCount: 8,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => ProductItem(productName: "productName", price: int,),
                        ),
                      ),
                     VerticalText(amazeText: AppStrings.newest,)
                    ],
                  ),
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}


class VerticalText extends StatelessWidget {
  const VerticalText({super.key,required this.amazeText});

final String amazeText;
  @override
  Widget build(BuildContext context) {
    return  RotatedBox(
                        quarterTurns: -1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Transform.rotate(
                                  angle: 1.5,
                                  child: SvgPicture.asset(Assets.svg.arrowLeft)),
                                Dimens.medium.width,
                                Text(AppStrings.seeAll,style: LightAppTextStyle.seeMore,),
                              ],
                            ),
                            Dimens.medium.height,
                            Text(amazeText,style: LightAppTextStyle.wonderTextStyle,),
                            Dimens.medium.height
                          ],
                        ),
    );
  }
}