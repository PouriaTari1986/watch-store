import 'package:di_state_managment/componnet/button_style.dart';
import 'package:di_state_managment/componnet/extension.dart';
import 'package:di_state_managment/data/models/user.dart';
import 'package:di_state_managment/resource/dimens.dart';
import 'package:di_state_managment/resource/strings.dart';
import 'package:di_state_managment/route/names.dart';
import 'package:di_state_managment/screens/register/cubit/register_cubit.dart';
import 'package:di_state_managment/utils/imag_handler.dart';
import 'package:di_state_managment/widgets/app_text_field.dart';
import 'package:di_state_managment/widgets/avatar.dart';
import 'package:di_state_managment/widgets/main_bottun.dart';
import 'package:di_state_managment/widgets/registeration_app_bar.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _controllerNameLastName = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerAddress = TextEditingController();
  final TextEditingController _controllerPostalCode = TextEditingController();
  final TextEditingController _controllerLocation = TextEditingController();
  double lat = 0.0;
  double lng = 0.0;
  ImageHandler imageHandler = ImageHandler();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: RegisterationAppBar(size: size),
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: BlocProvider(
                create: (context) => RegisterCubit(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Dimens.large.height,

                    Avatar(
                      file: imageHandler.getImage,
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (_) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  leading: Icon(Icons.photo_library),
                                  title: Text("انتخاب از گالری"),
                                  onTap: () async {
                                    Navigator.pop(context);
                                    await imageHandler.pickAndCropImage(
                                      source: ImageSource.gallery,
                                      context: context,
                                    );
                                    setState(() {});
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.camera_alt),
                                  title: Text("انتخاب از دوربین"),
                                  onTap: () async {
                                    Navigator.pop(context);
                                    await imageHandler.pickAndCropImage(
                                      source: ImageSource.camera,
                                      context: context,
                                    );
                                    setState(() {});
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    Dimens.large.height,
                    AppTextField(
                      lable: AppStrings.prName,
                      hint: AppStrings.prNameHint,
                      controller: _controllerNameLastName,
                    ),
                    AppTextField(
                      lable: AppStrings.stablePhone,
                      hint: AppStrings.stablePhoneHint,
                      controller: _controllerPhone,
                    ),
                    AppTextField(
                      lable: AppStrings.address,
                      hint: AppStrings.addressHint,
                      controller: _controllerLocation,
                    ),
                    AppTextField(
                      lable: AppStrings.postalCode,
                      hint: AppStrings.postalCodeHint,
                      controller: _controllerPostalCode,
                    ),
                    BlocConsumer<RegisterCubit, RegisterState>(
                      listener: (context, state) {
                        if (state is LocationPickedState) {
                          _controllerLocation.text = state.address ?? "";
                          lat = state.location!.latitude;
                          lng = state.location!.longitude;
                        }
                      },
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () {
                            BlocProvider.of<RegisterCubit>(
                              context,
                            ).pickLocation(context: context);
                          },
                          child: AppTextField(
                            lable: AppStrings.location,
                            hint: AppStrings.locationHint,
                            controller: _controllerLocation,
                            icon: Icon(Icons.location_on_outlined),
                          ),
                        );
                      },
                    ),
                    BlocConsumer<RegisterCubit, RegisterState>(
                      listener: (context, state) {
                        if (state is OkResponseState) {
                          Navigator.pushNamed(context, ScreensNames.mainScreen);
                        } else if (state is ErrorState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("خطایی رخ داده")),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is LoadingState) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return MainBottun(
                            text: AppStrings.register,
                            onPressed: (() async {
                              User user = User(
                                
                                name: _controllerNameLastName.text,
                                phone: _controllerPhone.text,
                                address: _controllerAddress.text,
                                postalCode: _controllerPostalCode.text,
                                image: await MultipartFile.fromFile(
                                  imageHandler.getImage!.path,
                                ),
                                lat: lat,
                                lng: lng,
                              );
                              // ignore: use_build_context_synchronously
                              BlocProvider.of<RegisterCubit>(
                                // ignore: use_build_context_synchronously
                                context,
                              ).register(user: user);
                            }),
                            style: AppButtonStyle.mainButtonStyle,
                          );
                        }
                      },
                    ),
                    Dimens.large.height,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
