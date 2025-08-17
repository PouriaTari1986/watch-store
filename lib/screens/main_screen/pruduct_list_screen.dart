
import 'package:flutter/material.dart';

class PruductListScreen extends StatelessWidget {
  const PruductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Scaffold(
          body:  Container(
            
            color: Colors.white,
            width: double.infinity,
            height: double.infinity,
            child: Text("لیست محصولات",style: TextStyle(fontSize: 30),),
          ),
        ),
      ),
    );
  }
}