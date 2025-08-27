import 'package:di_state_managment/componnet/button_style.dart';
import 'package:di_state_managment/componnet/extension.dart';
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
class SendSmsScreen extends StatelessWidget {
  SendSmsScreen({super.key});
  final TextEditingController _controller = TextEditingController();
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
                controller: _controller,
              ),
              BlocConsumer<AuthenticationCubit, AuthenticationState>(
                listener: (context, state) {
                  if (state is LoadedState) {
                     
                    Navigator.pushNamed(
                      context,
                      ScreensNames.verificationCodeScreen,
                      arguments: state.mobile,
                    );
                  } else if (state is ErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.redAccent,
                        duration: Duration(milliseconds: 800),
                        content: Text("خطا رخ داده است"),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is LoadingState) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return MainBottun(
                      text: AppStrings.sendingCode,
                      onPressed: (() {
                        BlocProvider.of<AuthenticationCubit>(
                          context,
                        ).sendSms(_controller.text);
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
