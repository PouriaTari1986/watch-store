import 'dart:async';
import 'dart:developer';

import 'package:di_state_managment/componnet/button_style.dart';
import 'package:di_state_managment/componnet/extension.dart';
import 'package:di_state_managment/componnet/text_style.dart';
import 'package:di_state_managment/gen/assets.gen.dart';
import 'package:di_state_managment/resource/dimens.dart';
import 'package:di_state_managment/resource/strings.dart';
import 'package:di_state_managment/route/names.dart';
import 'package:di_state_managment/screens/authentication/cubit/authentication_cubit.dart';
import 'package:di_state_managment/utils/format_time.dart';
import 'package:di_state_managment/widgets/app_text_field.dart';
import 'package:di_state_managment/widgets/main_bottun.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  final TextEditingController _controller = TextEditingController();
  late Timer _timer;
  int _start = 120;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
          setState(() {
        if (_start == 0) {
          timer.cancel();
          Navigator.of(context).pop();
        } else {
          _start--;
          // چاپ مطمئن در Debug Console
        }
      });

    });
  }


  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mobileRoutArgument =
        ModalRoute.of(context)!.settings.arguments as String;

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
              Text(
                AppStrings.submitedNum.replaceAll(
                  AppStrings.replace,
                  mobileRoutArgument,
                ),
                style: LightAppTextStyle.title,
              ),
              Dimens.large.height,
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Text(
                  AppStrings.editNum,
                  style: LightAppTextStyle.editNumber,
                ),
              ),
              (Dimens.large * 2).height,
              AppTextField(
                lable: AppStrings.enterCode,
                hint: AppStrings.enterCodeHint,
                controller: _controller,
                prefixLable: formatTime(_start),
              ),
              BlocConsumer<AuthenticationCubit, AuthenticationState>(
             
                listener: (context, state) {
                  if (_timer.isActive) _timer.cancel();

                  if (state is VerifiedIsNotRegisterdeState) {
                    Navigator.pushNamed(
                      context,
                      ScreensNames.registerScreen,
                    );
                
                  }
                  else if (state is VerifiedIsRegisterdeState) {
                    Navigator.pushReplacementNamed(
                      context,
                      ScreensNames.mainScreen,
                    );
                  }
                },
             
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return MainBottun(
                      text: AppStrings.edmae,
                      onPressed: () {
                        log(
                          "📌 Verification Code Entered: ${_controller.text.trim()}",
                          name: "VerificationCodeScreen",
                        );
                        context.read<AuthenticationCubit>().verifyCode(
                          mobileRoutArgument,
                          _controller.text.trim(),
                        );
                      },
                      style: AppButtonStyle.mainButtonStyle,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
