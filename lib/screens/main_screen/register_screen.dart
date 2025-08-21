import 'package:di_state_managment/componnet/button_style.dart';
import 'package:di_state_managment/componnet/extension.dart';
import 'package:di_state_managment/resorse/dimens.dart';
import 'package:di_state_managment/resorse/strings.dart';
import 'package:di_state_managment/route/names.dart';
import 'package:di_state_managment/widgets/app_text_field.dart';
import 'package:di_state_managment/widgets/avatar.dart';
import 'package:di_state_managment/widgets/main_bottun.dart';
import 'package:di_state_managment/widgets/registeration_app_bar.dart.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final TextEditingController _controllerNameLastName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size  = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: RegisterationAppBar(size: size),
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Dimens.large.height,
                  Avatar(),
                  Dimens.large.height,
                  AppTextField(
                    lable: AppStrings.prName,
                    hint: AppStrings.prNameHint,
                    controller: _controllerNameLastName,
                  ),
                  AppTextField(
                    lable: AppStrings.stablePhone,
                    hint: AppStrings.stablePhoneHint,
                    controller: _controllerNameLastName,
                  ),
                  AppTextField(
                    lable: AppStrings.address,
                    hint: AppStrings.addressHint,
                    controller: _controllerNameLastName,
                  ),
                  AppTextField(
                    lable: AppStrings.postalCode,
                    hint: AppStrings.postalCodeHint,
                    controller: _controllerNameLastName,
                  ),
                  AppTextField(
                    lable: AppStrings.location,
                    hint: AppStrings.locationHint,
                    controller: _controllerNameLastName,
                    icon: Icon(Icons.location_on_outlined),
                  ),
                  MainBottun(text: AppStrings.register, onPressed: ((){
                    Navigator.pushNamed(context,ScreensNames.mainScreen );
                  }), style: AppButtonStyle.mainButtonStyle,),
                  Dimens.large.height
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

