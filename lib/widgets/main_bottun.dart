

import 'package:di_state_managment/componnet/text_style.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainBottun extends StatelessWidget {

  final String text;
final  Function()onPressed;
 final ButtonStyle? style;
  const MainBottun({super.key, 
    required this.text,
    required this.onPressed,
    required this.style
    
    });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height*0.07,
      width: size.width*0.75,
      child: ElevatedButton(
        
        style: style,
        onPressed: onPressed, 
        child:Text(text,style: LightAppTextStyle.elevetedBotton),)
    )
    ;
  }
}