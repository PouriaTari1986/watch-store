import 'package:di_state_managment/componnet/button_style.dart';
import 'package:di_state_managment/componnet/extension.dart';
import 'package:di_state_managment/gen/assets.gen.dart';
import 'package:di_state_managment/resorse/dimens.dart';
import 'package:di_state_managment/resorse/strings.dart';
import 'package:di_state_managment/route/names.dart';
import 'package:di_state_managment/widgets/app_text_field.dart';
import 'package:di_state_managment/widgets/main_bottun.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SentOtpScreen extends StatelessWidget {
  SentOtpScreen({super.key});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(Assets.png.whatchStore.path),
              (Dimens.large * 2).height,
              AppTextField(
                lable: AppStrings.enterYourNum,

                hint: AppStrings.enterYourNumHint,
                controller: controller,
              ),
              MainBottun(
                text: AppStrings.sendingCode,
                onPressed: (() =>
                    Navigator.pushNamed(context, ScreensNames.getOtpScrren)), style: AppButtonStyle.mainButtonStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
