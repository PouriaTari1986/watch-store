import 'package:di_state_managment/componnet/decorations.dart';
import 'package:di_state_managment/componnet/extension.dart';
import 'package:di_state_managment/componnet/text_style.dart';
import 'package:di_state_managment/gen/assets.gen.dart';
import 'package:di_state_managment/resource/dimens.dart';
import 'package:di_state_managment/resource/strings.dart';
import 'package:di_state_managment/widgets/app_bar.dart';
import 'package:di_state_managment/widgets/profile_item.dart';
import 'package:di_state_managment/widgets/surface_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(AppStrings.profile, style: LightAppTextStyle.title),
          ),
        ),

        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimens.large),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Dimens.large.height,

                  ClipRRect(
                    borderRadius: BorderRadius.circular(300),
                    child: Image.asset(Assets.png.user.path, scale: 0.7),
                  ),
                  Dimens.medium.height,
                  Text("پوریا ترابزداه طاری", style: LightAppTextStyle.title),
                  Dimens.large.height,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        AppStrings.activatedAdd,
                        style: LightAppTextStyle.title,
                      ),
                      Dimens.medium.height,
                      Row(
                        children: [
                          SvgPicture.asset(Assets.svg.vector),
                          Expanded(
                            child: Text(
                              AppStrings.lurem,
                              style: LightAppTextStyle.title,
                              softWrap: true,
                              maxLines: 2,
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),

                     
                      Dimens.large.height,
                      ProfileItem(
                        iconPath: Assets.svg.card,
                      
                        text: AppStrings.cartNo,
                      ),
                         Dimens.medium.height,
                                            ProfileItem(
                                              iconPath: Assets.svg.vuesaxLinearCall,
                      
                                              text: AppStrings.phonrNo,
                                            ),
                                            Dimens.medium.height,
                                            ProfileItem(
                                              iconPath: Assets.svg.userProfile,
                      
                                              text: AppStrings.myNae,
                                            ),
                   
                    ],
                  ),
                  Dimens.large.height,
                  SurfaceContainer(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        AppStrings.terms,
                        style: LightAppTextStyle.title,
                      ),
                    ),
                  ),

                  Dimens.large.height,

                  ProfileDecoration(
                    child: Padding(
                      padding: const EdgeInsets.only(top: Dimens.xlarge),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,

                        children: [
                          Column(
                            children: [
                              Image.asset(Assets.png.delivered.path),
                              Dimens.small.height,
                              Text(AppStrings.delivered),
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(Assets.png.cnaceled.path),
                              Dimens.small.height,
                              Text(AppStrings.cnacels),
                            ],
                          ),

                          Column(
                            children: [
                              Image.asset(Assets.png.underProsses.path),
                              Dimens.small.height,
                              Text(AppStrings.inProgress),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Dimens.medium.height,
                  ProfileAddDecoration(
                    child: Image.asset(
                      Assets.png.addvertise.path,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
