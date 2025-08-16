





import 'package:di_state_managment/componnet/theme.dart';
import 'package:di_state_managment/screens/rigister_screen.dart';

import 'package:flutter/material.dart';

void main() {

runApp(MyApp());

    
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   //root widget of platform
    return MaterialApp(
        theme: lightTheme(),
        debugShowCheckedModeBanner: false,
        title: "watch store",
        home: RigisterScreen()
    );
  }
}



