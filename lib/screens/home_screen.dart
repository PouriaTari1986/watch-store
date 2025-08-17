import 'package:di_state_managment/screens/main_screen/pruduct_list_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: double.infinity,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PruductListScreen())),
        child: Text("مشاهده همه")),
    );
  }
}