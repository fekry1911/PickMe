import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasalni1/feature/Passenger/set_data/presentation/set_data.dart';
import 'package:wasalni1/feature/driver/home/presentation/driver_home.dart';
import 'package:wasalni1/feature/driver/set_data/presentation/set_data.dart';
import 'package:wasalni1/feature/login/presentation/login_screen.dart';
import 'package:wasalni1/feature/splash_screen/presentation/splash_screen.dart';

import '../../feature/Passenger/home/presentation/passenger_home.dart';
import '../../feature/driver/set_data/logic/set_up_driver_data_cubit.dart';
import '../../feature/login/logic/login_cubit.dart';
import '../../feature/register/logic/registeration_cubit.dart';
import '../../feature/register/presentation/register_screen.dart';
import '../const/const.dart';
import '../di/di.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
      case splashScreen: // من const.dart
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case loginScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => sl<LoginCubit>(),
            child: LoginScreen(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 800),
        );
      case registerScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => sl<RegisterCubit>(),
            child: RegisterScreen(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 800),
        );

      case driverHome: // من const.dart
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => DriverHome(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 800),
        );

      case driverSetData: // من const.dart
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => sl<SetUpDriverDataCubit>(),
            child: SetDataDriver(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 800),
        );
      case passengerHome: // من const.dart
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              PassengerHome(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 800),
        );
      case passengerSetData: // من const.dart
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              SetDataPassenger(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 800),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text(
                "404 - Page Not Found",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
    }
  }
}
