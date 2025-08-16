
import 'package:di_state_managment/route/names.dart';
import 'package:di_state_managment/screens/get_otp_screen.dart';
import 'package:di_state_managment/screens/register_screen.dart';
import 'package:di_state_managment/screens/sent_otp_screen.dart';
import 'package:flutter/widgets.dart';

Map<String,Widget Function(BuildContext)> routes ={

  ScreensNames.rout: (context) => SentOtpScreen(),

  ScreensNames.getOtpScrren: (context) => GetOtpScreen(),

  ScreensNames.registerScreen: (context) => RegisterScreen(),

};