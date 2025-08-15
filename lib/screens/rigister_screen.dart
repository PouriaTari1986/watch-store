import 'package:di_state_managment/componnet/extension.dart';
import 'package:di_state_managment/gen/assets.gen.dart';
import 'package:di_state_managment/resorse/dimens.dart';
import 'package:di_state_managment/resorse/strings.dart';
import 'package:di_state_managment/widgets/app_text_field.dart';
import 'package:di_state_managment/widgets/avatar.dart';
import 'package:di_state_managment/widgets/main_bottun.dart';
import 'package:flutter/material.dart';

class RigisterScreen extends StatelessWidget {
  RigisterScreen({super.key});
  final TextEditingController _controllerNameLastName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                MainBottun(text: AppStrings.register, onPressed: ((){})),
                Dimens.large.height
              ],
            ),
          ),
        ),
      ),
    );
  }
}
