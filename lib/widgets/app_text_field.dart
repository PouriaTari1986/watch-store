import 'package:di_state_managment/componnet/extension.dart';
import 'package:di_state_managment/resorse/dimens.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppTextField extends StatelessWidget {
  final String lable;
  final String hint;
  final TextEditingController controller;
  final Widget icon;
  final TextAlign textAlign;
  final TextInputType? inputType;
  final String prefixLable;
  const AppTextField({
    super.key,
    this.prefixLable = "",
    required this.lable,
    required this.hint,
    required this.controller,
    this.icon = const SizedBox(),
    this.textAlign = TextAlign.center,
    this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.all(Dimens.medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: size.width * 0.75,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(prefixLable), Text(lable)],
            ),
          ),

          Dimens.medium.height,
          SizedBox(
            height: size.height * 0.07,
                      width: size.width*0.75,

            child: TextField(
              textAlign: textAlign,
              controller: controller,
              keyboardType: inputType,
              decoration: InputDecoration(hintText: hint, prefixIcon: icon),
            ),
          ),
        ],
      ),
    );
  }
}
