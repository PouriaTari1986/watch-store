
import 'package:di_state_managment/route/names.dart';
import 'package:di_state_managment/screens/authentication/verification_code_screen.dart';
import 'package:di_state_managment/screens/home_screen.dart';
import 'package:di_state_managment/screens/main_screen.dart';
import 'package:di_state_managment/screens/main_screen/product_list_screen.dart';
import 'package:di_state_managment/screens/main_screen/product_single_screen.dart';
import 'package:di_state_managment/screens/register/register_screen.dart';
import 'package:di_state_managment/screens/authentication/send_sms_screen.dart';
import 'package:flutter/widgets.dart';

Map<String,Widget Function(BuildContext)> routes ={

  ScreensNames.sendSmsScreen: (context) => SendSmsScreen(),

  ScreensNames.verificationCodeScreen: (context) => VerificationCodeScreen(),

  ScreensNames.registerScreen: (context) => RegisterScreen(),

  ScreensNames.mainScreen: (context) => MainScreen(),


  ScreensNames.pruductListScreen: (context) => ProductListScreen(),


  ScreensNames.homeScreen: (context) => HomeScreen(),


  ScreensNames.pruductSingleScreen: (context) => ProductSingleScreen(),

};