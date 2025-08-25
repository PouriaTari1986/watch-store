import 'package:di_state_managment/componnet/theme.dart';
import 'package:di_state_managment/route/routes.dart';
import 'package:di_state_managment/screens/authentication/cubit/authentication_cubit.dart';
import 'package:di_state_managment/screens/authentication/send_sms_screen.dart';
import 'package:di_state_managment/screens/main_screen.dart';
import 'package:di_state_managment/utils/shared_preferences_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await  SharedPreferencesManager().init();
await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //root widget of platform
    return BlocProvider(
      create: (context) => AuthenticationCubit(),
      child: MaterialApp(
        theme: lightTheme(),
        debugShowCheckedModeBanner: false,
        title: "watch store",
        // initialRoute: ScreensNames.rout,
        routes: routes,
        home: BlocBuilder<AuthenticationCubit, AuthenticationState>(
          builder: (context, state) {
            if (state is LoggedInState) {
              return MainScreen();
            } else if(state is LoggeOutState){
              return SendSmsScreen();
            }else{
              return SendSmsScreen();
            }
            
          },
        ),
      ),
    );
  }
}
