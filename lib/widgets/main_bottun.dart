

import 'package:di_state_managment/componnet/button_style.dart';
import 'package:di_state_managment/componnet/text_style.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainBottun extends StatelessWidget {

  final String text;
final  Function()onPressed;

  const MainBottun({
    required this.text,
    required this.onPressed,
    
    super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height*0.07,
      width: size.width*0.75,
      child: ElevatedButton(
        style: AppButtonStyle.mainButtonStyle,
        onPressed: onPressed, 
        child:Text(text,style: LightAppTextStyle.elevetedBotton),)
    )
    ;
  }
}