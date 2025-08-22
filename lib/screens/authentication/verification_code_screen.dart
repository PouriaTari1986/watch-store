
import 'dart:async';


import 'package:di_state_managment/componnet/button_style.dart';
import 'package:di_state_managment/componnet/extension.dart';
import 'package:di_state_managment/componnet/text_style.dart';
import 'package:di_state_managment/gen/assets.gen.dart';
import 'package:di_state_managment/resource/dimens.dart';
import 'package:di_state_managment/resource/strings.dart';
import 'package:di_state_managment/route/names.dart';
import 'package:di_state_managment/screens/authentication/cubit/authentication_cubit.dart';
import 'package:di_state_managment/widgets/app_text_field.dart';
import 'package:di_state_managment/widgets/main_bottun.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
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
    startTimer();
    super.initState();
  }
  void startTimer(){
   const oneSec = Duration(seconds: 1);
   _timer = Timer.periodic(oneSec, (timer){
   if(!mounted)return;
    setState(() {
      if (_start == 0) {
        _timer.cancel();
        Navigator.of(context).pop();
      } else {
        _start--;
      }
    });
   });

  }
   String formatTime(int sec){
      int min = sec ~/ 60;
      int seconds = sec % 60;
      String  minStr = min.toString().padLeft(2,"0");
      String  secondsStr = seconds.toString().padLeft(2,"0");
      return '$minStr : $secondsStr';
    }
    @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    
    // Size size = MediaQuery.of(context).size;
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
                
                child: Text(AppStrings.editNum, style: LightAppTextStyle.editNumber)),
              (Dimens.large * 2).height,

              AppTextField(
                lable: AppStrings.enterCode,

                hint: AppStrings.enterCodeHint,
                controller: _controller,
                prefixLable: formatTime(_start)
              ),
              BlocConsumer<AuthenticationCubit, AuthenticationState>(
                listenWhen: (previous, current) => current is VerifiedIsNotRegisterdeState || current is VerifiedIsRegisterdeState,
                listener: (context, state) {
                  _timer.cancel();
                if (state is VerifiedIsNotRegisterdeState) {
                  Navigator.pushNamed(context, ScreensNames.registerScreen);
                } else if(state is VerifiedIsRegisterdeState) {
                  Navigator.pushNamed(context, ScreensNames.mainScreen);
                }
                },
                buildWhen: (previous, current) => current is! VerifiedIsNotRegisterdeState && current is! VerifiedIsRegisterdeState,
                builder: (context, state) {
                  if (state is LoadingState) {
                    return Center(child: CircularProgressIndicator(),);
                  } else {
                    return MainBottun(
                    text: AppStrings.edmae,
                    onPressed: (() {
                      BlocProvider.of<AuthenticationCubit>(context).verifyCode(mobileRoutArgument, _controller.text);
                    }),
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
