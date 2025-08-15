
import 'package:di_state_managment/componnet/extension.dart';
import 'package:di_state_managment/gen/assets.gen.dart';
import 'package:di_state_managment/resorse/dimens.dart';
import 'package:flutter/material.dart';



class SentOtpScreen extends StatelessWidget {
  const SentOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(Assets.png.whatchStore.path),
            (Dimens.large*2).height,
            TextField()
          ],

        )),
    );
  }
}