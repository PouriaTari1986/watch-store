
import 'package:di_state_managment/route/names.dart';
import 'package:di_state_managment/screens/main_screen/get_otp_screen.dart';
import 'package:di_state_managment/screens/main_screen.dart';
import 'package:di_state_managment/screens/main_screen/pruduct_list_screen.dart';
import 'package:di_state_managment/screens/main_screen/pruduct_single_screen.dart';
import 'package:di_state_managment/screens/main_screen/register_screen.dart';
import 'package:di_state_managment/screens/main_screen/sent_otp_screen.dart';
import 'package:flutter/widgets.dart';

Map<String,Widget Function(BuildContext)> routes ={

  ScreensNames.rout: (context) => SentOtpScreen(),

  ScreensNames.getOtpScrren: (context) => GetOtpScreen(),

  ScreensNames.registerScreen: (context) => RegisterScreen(),

  ScreensNames.mainScreen: (context) => MainScreen(),


  ScreensNames.pruductListScreen: (context) => PruductListScreen(),


  ScreensNames.pruductSingleScreen: (context) => PruductSingleScreen(),

};