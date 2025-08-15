





import 'package:flutter/material.dart';

void main() {

runApp(MyApp());

    
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   //root widget of platform
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "watch store",
        home: Container(),
    );
  }
}



