import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasalni1/feature/login/presentation/login_screen.dart';
import 'package:wasalni1/feature/splash_screen/presentation/splash_screen.dart';

import '../../feature/login/logic/login_cubit.dart';
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
              create: (context) => sl<LoginCubit>(),
              child: RegisterScreen(),
            ),
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
