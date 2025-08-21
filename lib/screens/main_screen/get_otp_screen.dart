import 'package:di_state_managment/componnet/button_style.dart';
import 'package:di_state_managment/componnet/extension.dart';
import 'package:di_state_managment/componnet/text_style.dart';
import 'package:di_state_managment/gen/assets.gen.dart';
import 'package:di_state_managment/resorse/dimens.dart';
import 'package:di_state_managment/resorse/strings.dart';
import 'package:di_state_managment/route/names.dart';
import 'package:di_state_managment/widgets/app_text_field.dart';
import 'package:di_state_managment/widgets/main_bottun.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GetOtpScreen extends StatelessWidget {
  GetOtpScreen({super.key});
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
              (Dimens.large *2).height,
              Text(AppStrings.submitedNum.replaceAll(AppStrings.replace, "09122578846"),
              style: LightAppTextStyle.title,),
                Dimens.large.height,
              Text(AppStrings.editNum,style: LightAppTextStyle.editNumber,),
                (Dimens.large*2).height,
              
              
              AppTextField(
                lable: AppStrings.enterCode,
                
                hint: AppStrings.enterCodeHint,
                controller: controller,
                prefixLable: "2:55",
              ),
              MainBottun(text: AppStrings.edmae, onPressed: ((){
                Navigator.pushNamed(context, ScreensNames.registerScreen);
              }), style: AppButtonStyle.mainButtonStyle,)
            ],
          ),
        ),
      ),
    );
  }
}
