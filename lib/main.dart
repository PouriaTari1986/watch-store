





import 'package:di_state_managment/componnet/theme.dart';
import 'package:di_state_managment/route/names.dart';
import 'package:di_state_managment/route/routes.dart';

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
        initialRoute: ScreensNames.rout,
        routes: routes ,
        // home: ProductListScreen(),
    );
  }
}



