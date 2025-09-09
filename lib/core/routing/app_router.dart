
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../feature/splash_screen/presentation/splash_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case "/splash-screens":
        return MaterialPageRoute(builder: (_) => SplashScreen());

    }

    return null;
  }
}