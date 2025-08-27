import 'package:di_state_managment/componnet/theme.dart';
import 'package:di_state_managment/data/repo/cart_repo.dart';
import 'package:di_state_managment/route/routes.dart';
import 'package:di_state_managment/screens/authentication/cubit/authentication_cubit.dart';
import 'package:di_state_managment/screens/authentication/send_sms_screen.dart';
import 'package:di_state_managment/screens/cart/bloc/cart_bloc.dart';
import 'package:di_state_managment/screens/main_screen.dart';
import 'package:di_state_managment/utils/shared_preferences_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesManager().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthenticationCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Watch Store',
        theme: lightTheme(),
        routes: routes,
        home: BlocBuilder<AuthenticationCubit, AuthenticationState>(
          builder: (context, state) {
            if (state is LoggedInState) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider<CartBloc>(
                    create: (context) {
                      final cartBloc = CartBloc(cartRepository);
                      cartBloc.add( LoadCartEvent()); // بارگذاری اولیه سبد خرید
                      return cartBloc;
                    },
                  ),
                ],
                child: const MainScreen(),
              );
            } else {
              return SendSmsScreen();
            }
          },
        ),
      ),
    );
  }
}
