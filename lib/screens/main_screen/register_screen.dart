import 'package:di_state_managment/componnet/button_style.dart';
import 'package:di_state_managment/componnet/extension.dart';
import 'package:di_state_managment/resource/dimens.dart';
import 'package:di_state_managment/resource/strings.dart';
import 'package:di_state_managment/route/names.dart';
import 'package:di_state_managment/utils/imag_handler.dart';
import 'package:di_state_managment/widgets/app_text_field.dart';
import 'package:di_state_managment/widgets/avatar.dart';
import 'package:di_state_managment/widgets/main_bottun.dart';
import 'package:di_state_managment/widgets/registeration_app_bar.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';



// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _controllerNameLastName = TextEditingController();

  ImageHandler imageHandler = ImageHandler();

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
                  Avatar(
                    
                    onTap: (){
                        showModalBottomSheet(
                          context: context,
                           builder: (context) {
                             return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.photo_library),
                                  title: const Text("انتخاب از گالری"),
                                  onTap: () async{
                                    Navigator.pop(context);
                                    await imageHandler.pickAndCropImage(source: ImageSource.gallery);
                                    setState(() {                                      
                                    });
                                    
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.camera_alt),
                                  title: const Text("گرفتن عکس از دوربین"),
                                  onTap: () async{
                                    Navigator.pop(context);
                                    await imageHandler.pickAndCropImage(source: ImageSource.camera);
                                    setState(() {
                                      
                                    });
                                  },
                                )
                              ],
                             );
                           },);
                    }
                    
                    ,file: null,),
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

